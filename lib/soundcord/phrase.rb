require 'soundcord/phonetizable'
require 'soundcord/word'

class SoundCord::Phrase < SoundCord::Phonetizable

  def to_s
    self.homophone or self.phonetize
  end

protected
  def phonetize
    super

    self.homophone = phonetized_words.join(' ')

    remove_extra_spaces!
    trimmed!

    self.homophone
  end

  def words
    self.original.split ' '
  end

  def phonetized_words
    self.words.map do |word|
      SoundCord::Word.new(word).to_s
    end
  end

  def remove_extra_spaces!
    self.homophone.gsub! /\s{2,}/, ' '
  end

  def trimmed!
    self.homophone.strip!
  end
end