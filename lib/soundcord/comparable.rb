module SoundCord::Comparable
  def ==(obj)
    self.to_sound == obj.to_sound
  end

  def !=(obj)
    self.to_sound != obj.to_sound
  end
end