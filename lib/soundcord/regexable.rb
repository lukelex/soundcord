module Regexable
  def mount_regexp sentence, options = { :terminations => false, :initiations => false }
    regexp = '/'
    regexp += '^' if options[:initiations]
    regexp += '('
    regexp += sentence.kind_of?(Array) ? sentence.join('|') : sentence
    regexp += ')'
    regexp += '\\b' if options[:terminations]
    regexp += '/'
    eval(regexp)
  end

  def mount_follow_up_regexp prefix, sufix, options = {}
    regexp = options[:not_eval] ? '' : '/'
    regexp += prefix
    regexp += '(?='
    regexp += '('
    regexp += sufix.kind_of?(Array) ? sufix.join('|') : sufix
    regexp += '))'
    regexp += '/' unless options[:not_eval]
    options[:not_eval] ? regexp : eval(regexp)
  end

  def mount_second_followed_by_regexp char, group
    regexp = '/' + not_first(char) + mount_follow_up_regexp(char, group, :not_eval => true) + '/'
    eval regexp
  end

  def mount_vowels_pronunciation_insignificance_regexp char
    eval "/([aeiou])#{char}(?=\\b|[^aeiou])/"
  end

  def mount_followed_by_consonant_regexp char
    eval "[#{char}](?![aeiou])"
  end

  def not_first char
    "([^#{char}]|^)"
  end
end