require 'soundcord/regexable'
require 'soundcord/comparable'

class SoundCord::Phonetizable < Struct.new(:original, :homophone)
  include SoundCord::Regexable
  include SoundCord::Comparable

protected
  def phonetize!
    SoundCord.load_language unless SoundCord.language
  end
end