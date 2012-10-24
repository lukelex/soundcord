# encoding: utf-8

require 'soundcord/algorithm'
require 'soundcord/config'

class SoundCord
  def self.phonetize text
    process_text text
  end

  def self.compare term_1, term_2
    homophone? term_1, term_2
  end

  def self.homophone? term_1, term_2
    phonetize(term_1) == phonetize(term_2)
  end
end
