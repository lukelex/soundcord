# encoding: utf-8

class SoundCord
  private
  def self.handle_text text, options = { :use_vogals => false }
    text = text.downcase

    text = remove_duplicity text
    text = handle_special_chars text
    text = handle_unusual_chars text
    text = handle_unusual_combinations text
    text = handle_terminations text
    text = remove_vogals(text) unless options[:use_vogals]
    text = remove_unwanted_chars text

    text.upcase
  end

  def self.handle_special_chars text
    text = text.gsub /(á|à|â|ã)/, 'a'
    text = text.gsub /(é|è|ê)/, 'e'
    text = text.gsub /(í|ì|î)/, 'i'
    text = text.gsub /(ó|ò|ô|õ)/, 'o'
    text = text.gsub /(ú|ù|û)/, 'u'
  end

  def self.handle_unusual_chars text
    text = text.gsub /y/, 'i'
  end

  def self.handle_unusual_combinations text
    text = text.gsub /(br|bl)/, 'b'

    text = text.gsub /ph/, 'f'

    text = text.gsub /(gr|mg|ng|rg|gl)/, 'g'

    text = text.gsub /(ge|gi|rj|mj|nj)/, 'j'

    text = text.gsub /(ce|ci|ch|cs)/, 's'

    text = text.gsub /ct/, 't'

    text = text.gsub /(q|ca|co|cu|ck|c)/, 'k'

    text = text.gsub /lh/, 'l'

    text = text.gsub /rm/, 'sm'

    text = text.gsub /(rm|gm|md|sm|ao\b)/, 'm'

    text = text.gsub /n/, 'm'

    text = text.gsub /ao\b/, 'm'

    text = text.gsub /nh/, 'n'

    text = text.gsub /pr/, 'p'

    text = text.gsub /(ç|x|ts|c|z|rs)/, 's'

    text = text.gsub /(tr|tl|lt|rt|st)/, 's'

    text = text.gsub /w/, 'v'
  end

  def self.handle_terminations text
    text = text.gsub /(s|z|r|m|n|ao|l)\b/, ''
  end

  def self.remove_vogals text
    text = text.gsub /(a|e|i|o|u)/, ''
  end

  def self.remove_unwanted_chars text
    text = text.gsub /h/, ''
  end

  def self.remove_duplicity text
    text.split(//).inject("") do |s,n|
      s + ((s[s.length-1..s.length-1] === n) ? '' : n )
    end
  end
end