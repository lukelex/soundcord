# encoding: utf-8

class SoundCord
  private
  def self.process_text text
    load_language

    text = text.downcase

    lang_yml[language].each do |key, values|
      case key
      when "terminations"
        text = process_group text, values, :terminations => true
      when "initiations"
        text = process_group text, values, :initiations => true
      else
        text = process_group text, values, options
      end
    end

    text = remove_duplicity text, :duplicate_exceptions => (lang_yml[language]["duplicate_exceptions"] ?
                                                            lang_yml[language]["duplicate_exceptions"] :
                                                            [])

    text.upcase
  end

  def self.remove_duplicity text, options
    text.split(//).inject("") do |s, n|
      last_s_char = s[s.length-1..s.length-1]
      s + ((last_s_char === n &&
            !options[:duplicate_exceptions].include?(n)) ? '' : n )
    end
  end

  def self.process_group text, group, options = {}
    group.each do |key, values|
      if values
        text = simple_replace text, key, values, options
      else
        text = simple_replace text, '', key, options
      end
    end
    return text
  end

  def self.simple_replace text, key, values, options
    regxp = mount_regxp values, options
    text.gsub regxp, key
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
end
