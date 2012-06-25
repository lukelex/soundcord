class Array
  # Search possible homphone matches within the array object for a given string word
  # Params:
  # +value+:: string to be phonetized and compared with the array items
  def homophones value
    self.select { |i| i.homophone? value }
  end
end