# encoding: utf-8

class SoundCord
  def self.phonetize text, use_vogals=false
    return handle_text(text, use_vogals)
  end

  def self.compare term_1, term_2, use_vogals=false
    homophone? term_1, term_2, use_vogals=false
  end

  def self.homophone? term_1, term_2, use_vogals=false
    handle_text(term_1, use_vogals) == handle_text(term_2, use_vogals)
  end

  private
  def self.handle_text text, use_vogals
    text.downcase!

    handle_special_chars text
    handle_unusual_chars text
    handle_unusual_combinations text
    handle_terminations text
    remove_vogals(text) unless use_vogals
    remove_unwanted_chars text
    text = remove_duplicity text

    text.upcase
  end

  def self.handle_special_chars text
    text.gsub! /(á|à|â|ã)/, 'a'
    text.gsub! /(é|è|ê)/, 'e'
    text.gsub! /(í|ì|î)/, 'i'
    text.gsub! /(ó|ò|ô|õ)/, 'o'
    text.gsub! /(ú|ù|û)/, 'u'
  end

  def self.handle_unusual_chars text
    text.gsub! /y/, 'i'
  end

  def self.handle_unusual_combinations text
    text.gsub! /(br|bl)/, 'b'

    text.gsub! /ph/, 'f'

    text.gsub! /(gr|mg|ng|rg|gl)/, 'g'

    text.gsub! /(ge|gi|rj|mj|nj)/, 'j'

    text.gsub! /(ce|ci|ch|cs)/, 's'

    text.gsub! /ct/, 't'

    text.gsub! /(q|ca|co|cu|ck|c)/, 'k'

    text.gsub! /lh/, 'l'

    text.gsub! /rm/, 'sm'

    text.gsub! /n/, 'm'

    text.gsub! /(rm|gm|md|sm|ao\b)/, 'm'

    text.gsub! /ao\b/, 'm'

    text.gsub! /nh/, 'n'

    text.gsub! /pr/, 'p'

    text.gsub! /(ç|x|ts|c|z|rs)/, 's'

    text.gsub! /(tr|tl|lt|rt|st)/, 's'

    text.gsub! /w/, 'v'
  end

  def self.handle_terminations text
    text.gsub! /(s|z|r|m|n|ao|l)\b/, ''
  end

  def self.remove_vogals text
    text.gsub! /(a|e|i|o|u)/, ''
  end

  def self.remove_unwanted_chars text
    text.gsub! /h/, ''
  end

  def self.remove_duplicity text
    text.split(//).uniq.inject("") { |s,n| s+n }
  end
end


class String
  def phonetize options = { :use_vogals => false }
    SoundCord.phonetize self, options[:use_vogals]
  end
  def compare_phntc compared
    SoundCord.compare self, compared
  end
  def compare_phonetically compared
    compare_phntc compared
  end
  def homophone? compared
    SoundCord.homophone? self, compared
  end
end