class Array
  def homophones value
    self.select { |i| i.homophone? value }
  end
end