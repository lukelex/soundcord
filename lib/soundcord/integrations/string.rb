class String
  # Returns the phonetic version of the passed string
  # Params:
  # +value+:: string to be phonetized
  def self.phonetize value
    value.to_sound
  end

  # Returns the phonetic version of the object string
  def to_sound
    SoundCord.phonetize self
  end

  # Returns the phonetic version of the object string
  def phonetize
    self.to_sound
  end

  # Compares the passed value with the object value, both in their phonetic version
  # Params:
  # +compared+:: the string the be compared with
  def homophone? compared
    SoundCord.homophone? self, compared
  end
end