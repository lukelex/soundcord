class String
  # Returns the phonetic version of the object string
  # Params:
  # +use_vowels+:: enables the vowel comparison feature (if avaiable)
  def phonetize
    SoundCord.phonetize self
  end

  # Returns the phonetic version of the passed string
  # Params:
  # +use_vowels+:: enables the vowel comparison feature (if avaiable)
  def self.phonetize value
    value.phonetize
  end

  # Compares the passed value with the object value, both in their phonetic version
  # Params:
  # +use_vowels+:: enables the vowel comparison feature (if avaiable)
  def homophone? compared
    SoundCord.homophone? self, compared
  end
end