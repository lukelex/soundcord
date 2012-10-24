# encoding: utf-8

require 'soundcord/integrations/string'
require 'soundcord/integrations/array'

class SoundCord
private
  def self.process_text text
    load_language unless language

    text = text.downcase

    lang_yml.each do |key, values|
      if key == 'terminations'
        text = process_group text, values, :terminations => true
      elsif key == 'initiations'
        text = process_group text, values, :initiations => true
      elsif key == 'follow_ups'
        text = process_follow_ups text, values, options
      elsif key == 'second_followed'
        text = process_second_followed text, values, options
      elsif key == 'vowels_pronunciation_insignificance'
        text = process_vowels_pronunciation_insignificance text, values, options
      elsif !key.include? 'duplicate'
        text = process_group text, values, options
      end
    end

    text = remove_duplicity text, :duplicate_exceptions => (lang_yml['duplicate_exceptions'])

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
        regexp = mount_follow_up_regexp prefix, sufixes
        text = text.gsub regexp, key
      end
    end
    return text
  end

  def self.process_second_followed text, group, options = {}
    group.each do |key, prefixes|
      prefixes.each do |prefix, sufixes|
        regexp = mount_second_followed_by_regexp prefix, sufixes
        text =~ regexp
        replacing = ($1 ? $1 : '') + key
        text = text.gsub regexp, replacing
      end
    end
    return text
  end

  def self.process_vowels_pronunciation_insignificance text, group, options = {}
    group.each do |key, value|
      regexp = mount_vowels_pronunciation_insignificance_regexp key
      text =~ regexp
      text = text.gsub regexp, ($1 || '')
    end
    return text
  end

  def self.process_followed_by_consonant_regexp text, group
    group.each do |key, value|
      regexp = mount_followed_by_consonant_regexp value
      text = text.gsub regexp, ''
    end
    return text
  end

  def self.simple_replace text, key, values, options
    regexp = mount_regexp values, options
    text.gsub regexp, key.to_s
  end

  def self.mount_regexp sentence, options = { :terminations => false, :initiations => false }
    regexp = "/"
    regexp += "^" if options[:initiations]
    regexp += "("
    regexp += sentence.kind_of?(Array) ? sentence.join("|") : sentence
    regexp += ")"
    regexp += "\\b" if options[:terminations]
    regexp += "/"
    eval(regexp)
  end

  def self.mount_follow_up_regexp prefix, sufix, options = {}
    regexp = options[:not_eval] ? "" : "/"
    regexp += prefix
    regexp += "(?="
    regexp += "("
    regexp += sufix.kind_of?(Array) ? sufix.join("|") : sufix
    regexp += "))"
    regexp += "/" unless options[:not_eval]
    options[:not_eval] ? regexp : eval(regexp)
  end

  def self.mount_second_followed_by_regexp char, group
    regexp = "/" + not_first(char) + mount_follow_up_regexp(char, group, :not_eval => true) + "/"
    eval regexp
  end

  def self.mount_vowels_pronunciation_insignificance_regexp char
    eval "/([aeiou])#{char}(?=\\b|[^aeiou])/"
  end

  def self.mount_followed_by_consonant_regexp char
    eval "[#{char}](?![aeiou])"
  end

  def self.not_first char
    "([^#{char}]|^)"
  end
end