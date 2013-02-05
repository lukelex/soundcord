# encoding: utf-8

require 'soundcord/config'

require 'soundcord/integrations/string'
require 'soundcord/integrations/array'

require 'soundcord/word'

module SoundCord
  def self.phonetize text
    Word.new(text).to_s
  end

  def self.compare term_1, term_2
    homophone? term_1, term_2
  end

  def self.homophone? term_1, term_2
    phonetize(term_1) == phonetize(term_2)
  end
end
