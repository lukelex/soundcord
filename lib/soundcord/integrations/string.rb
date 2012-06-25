class String
  # Returns the phonetic version of the object string
  # Params:
  # +use_vowels+:: enables the vowel comparison feature (if avaiable)
  def phonetize options = { :use_vowels => false }
    SoundCord.phonetize self, options
  end

  # Returns the phonetic version of the passed string
  # Params:
  # +use_vowels+:: enables the vowel comparison feature (if avaiable)
  def self.phonetize value, options = { :use_vowels => false }
    value.phonetize
  end

  # DEPRECATED: Please use homophone? instead.
  def compare_phntc compared
    warn "[DEPRECATION] `compare_phntc` is deprecated. Please use `homophone?` instead."
    self.homophone? compared
  end
  # DEPRECATED: Please use homophone? instead.
  def compare_phonetically compared
    warn "[DEPRECATION] `compare_phonetically` is deprecated. Please use `homophone?` instead."
    self.homophone? compared
  end

  # Compares the passed value with the object value, both in their phonetic version
  # Params:
  # +use_vowels+:: enables the vowel comparison feature (if avaiable)
  def homophone? compared
    SoundCord.homophone? self, compared
  end
end