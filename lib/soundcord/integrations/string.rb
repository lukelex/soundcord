class String
  def phonetize options = { :use_vogals => false }
    SoundCord.phonetize self, options
  end

  def self.phonetize value
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

  def homophone? compared
    SoundCord.homophone? self, compared
  end
end