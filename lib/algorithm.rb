# encoding: utf-8

class SoundCord
  private
  def self.handle_text text, options = { :use_vowels => false }
    load_language

    text = text.downcase

    text = remove_duplicity text
    text = handle_special_chars text
    text = handle_unusual_combinations text
    text = handle_terminations text
    text = remove_vowels(text) unless options[:use_vowels]
    text = remove_undesired_chars text

    text.upcase
  end

  def self.handle_special_chars text
    lang_yml[language]["special_chars"].each do |k,v|
      text = simple_replace text, k, v
    end
    text
  end

  def self.handle_unusual_combinations text
    lang_yml[language]["unusual_combinations"].each do |k,v|
      text = simple_replace text, k, v
    end
    text
  end

  def self.handle_terminations text
    regxp = mount_regxp lang_yml[language]["terminations"], :termination => true
    text.gsub regxp, ''
  end

  def self.remove_vowels text
    regxp = mount_regxp lang_yml[language]["vowels"]
    text.gsub regxp, ''
  end

  def self.remove_undesired_chars text
    regxp = mount_regxp lang_yml[language]["undesired"]
    text.gsub regxp, ''
  end

  def self.remove_duplicity text
    text.split(//).inject("") do |s,n|
      s + ((s[s.length-1..s.length-1] === n) ? '' : n )
    end
  end

  def self.simple_replace text, k, v
    regxp = mount_regxp v
    text.gsub regxp, k
  end

  def self.mount_regxp sentence, options = { :termination => false }
    regxp = sentence.join("|")
    regxp = "/(" + regxp + ")"
    regxp += "\\b" if options[:termination]
    regxp += "/"
    eval(regxp)
  end
end