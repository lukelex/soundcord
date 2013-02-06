# encoding: utf-8

require 'test/unit'
require 'soundcord/integrations/string'

class SoundCordTest < Test::Unit::TestCase
  def test_phonetize_method_existance_in_instance
    assert_equal String.new.respond_to?(:phonetize), true
    assert_equal String.new.respond_to?(:to_sound), true
  end
  def test_phonetize_method_existance_in_class
    assert_equal String.respond_to?(:phonetize), true
  end
  def test_homophone_method_existance
    assert_equal String.new.respond_to?(:homophone?), true
  end
end
