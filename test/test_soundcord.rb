# encoding: utf-8

require 'test/unit'
require 'soundcord'

class SoundCordTest < Test::Unit::TestCase
  def test_simple_words
    assert_equal "João".phonetize, "J"
    assert_equal "Maria".phonetize, "MR"
    assert_equal "Helena".phonetize, "LM"
    assert_equal "Valmir".phonetize, "VLM"
    assert_equal "Walmir".phonetize, "VLM"
  end
  def test_comparations
    assert_equal SoundCord.phonetize("Joao"),
                  SoundCord.phonetize("João")
    assert_equal "Joao".compare_phonetically("João"), true
  end
  def test_comparator
    assert_equal "Marria".compare_phonetically("Maria"), true
  end
  def test_use_vogals_option
    assert_equal "Helena".phonetize(:use_vogals => true), "ELMA"
  end
end
