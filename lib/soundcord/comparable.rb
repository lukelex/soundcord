module SoundCord::Comparable
  def ==(obj)
    self.to_s == obj.to_s
  end

  def !=(obj)
    self.to_s != obj.to_s
  end
end