class String
  def phonetize options = { :use_vogals => false }
    SoundCord.phonetize self, options
  end
  def self.phonetize value
    value.phonetize
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