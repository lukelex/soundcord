# encoding: utf-8

class SoundCord
  private
  def self.process_text text
    load_language unless language

    text = text.downcase

    lang_yml.each do |key, values|
      if key == "terminations"
        text = process_group text, values, :terminations => true
      elsif key == "initiations"
        text = process_group text, values, :initiations => true
      elsif key == "follow_ups"
        text = process_follow_ups text, values, options
      elsif key == "second_followed"
        text = process_second_followed text, values, options
      elsif key == "vowels_proonunciation_insignificance"
        text = process_vowels_proonunciation_insignificance text, values, options
      elsif !key.include? "duplicate"
        text = process_group text, values, options
      end
    end

    text = remove_duplicity text, :duplicate_exceptions => (lang_yml["duplicate_exceptions"])

    text.upcase
  end

  def self.remove_duplicity text, options
    options[:duplicate_exceptions] = [] unless options[:duplicate_exceptions]

    text.split(//).inject("") do |s, n|
      last_s_char = s[s.length-1..s.length-1]
      s + ((last_s_char === n &&
            !options[:duplicate_exceptions].include?(n)) ? '' : n )
    end
  end

  def self.process_group text, group, options
    group.each do |key, values|
      if values
        text = simple_replace text, key, values, options
      else
        text = simple_replace text, '', key, options
      end
    end
    return text
  end

  def self.process_follow_ups text, group, options = {}
    group.each do |key, prefixes|
      prefixes.each do |prefix, sufixes|
        regxp = mount_follow_up_regxp prefix, sufixes
        text = text.gsub regxp, key
      end
    end
    return text
  end

  def self.process_second_followed text, group, options = {}
    group.each do |key, prefixes|
      prefixes.each do |prefix, sufixes|
        regxp = mount_second_followed_by_regxp prefix, sufixes
        text =~ regxp
        replacing = ($1 ? $1 : '') + key
        text = text.gsub regxp, replacing
      end
    end
    return text
  end

  def process_vowels_proonunciation_insignificance text, group
    group.each do |key, value|
      regxp = mount_vowels_proonunciation_insignificance_regxp value
      text =~ regxp
      text = text.gsub regxp, $1
    end
    return text
  end

  def self.process_followed_by_consonant_regxp text, group
    group.each do |key, value|
      regxp = mount_followed_by_consonant_regxp value
      text = text.gsub regxp, ''
    end
    return text
  end

  def self.simple_replace text, key, values, options
    regxp = mount_regxp values, options
    text.gsub regxp, key.to_s
  end

  def self.mount_regxp sentence, options = { :terminations => false, :initiations => false }
    regxp = "/"
    regxp += "^" if options[:initiations]
    regxp += "("
    regxp += sentence.kind_of?(Array) ? sentence.join("|") : sentence
    regxp += ")"
    regxp += "\\b" if options[:terminations]
    regxp += "/"
    eval(regxp)
  end

  def self.mount_follow_up_regxp prefix, sufix, options = {}
    regxp = options[:not_eval] ? "" : "/"
    regxp += prefix
    regxp += "(?="
    regxp += "("
    regxp += sufix.kind_of?(Array) ? sufix.join("|") : sufix
    regxp += "))"
    regxp += "/" unless options[:not_eval]
    options[:not_eval] ? regxp : eval(regxp)
  end

  def self.mount_second_followed_by_regxp char, group
    regxp = "/" + not_first(char) + mount_follow_up_regxp(char, group, :not_eval => true) + "/"
    eval(regxp)
  end

  def self.mount_vowels_proonunciation_insignificance_regxp char
    eval "/([aeiou])#{char}(?=\b|[^aeiou])/"
  end

  def self.mount_followed_by_consonant_regxp char
    eval "[#{char}](?![aeiou])"
  end

  def self.not_first char
    "([^#{char}]|^)"
  end
end
