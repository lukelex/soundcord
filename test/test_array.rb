# encoding: utf-8

require 'test/unit'
require 'soundcord/integrations/array'

class SoundCordTest < Test::Unit::TestCase
  def test_homophones_method_existance
    assert_equal Array.new.respond_to?(:homophones), true
    assert_equal Array.new.respond_to?(:phonetize), true
  end

  def test_phonetizing_the_array
    SoundCord.load_language 'en'

    result = %w(Lukas Marcy Richard John).phonetize
    expected = %w(LKS MRS RXRT JN)

    assert_equal expected, result
  end
end
