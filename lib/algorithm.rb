# encoding: utf-8

class SoundCord
  private
  def self.process_text text, options = { :use_vowels => false }
    load_language

    text = text.downcase

    lang_yml[language].each do |k,v|
      k.each do |k,v|
        text = process_group text, k, v, options
      end
    end

    text.upcase
  end

  def self.remove_duplicity text, options
    text.split(//).inject("") do |s,n|
      s + ((s[s.length-1..s.length-1] === n) ? '' : n )
    end
  end

  def self.process_group text, key, values, options
    if values
      return simple_replace text, key, values
    else
      return simple_replace text, '', key
    end
  end

  def self.simple_replace text, key, values, options
    regxp = mount_regxp values, options
    text.gsub regxp, key
  end

  def self.mount_regxp sentence, options = { :terminations => false, :initiations => false }
    regxp = "/"
    regxp += "^" if options[:initiations]
    regxp += "("
    regxp += sentence.join("|")
    regxp += ")"
    regxp += "\\b" if options[:terminations]
    regxp += "/"
    eval(regxp)
  end
end
