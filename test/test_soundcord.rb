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
  def test_simple_comparations
    assert_equal "Joao".homophone?("João"), true
    assert_equal "Helena".homophone?("Elena"), true
    assert_equal "Walmir".homophone?("Valmir"), true
    assert_equal "Marria".homophone?("Maria"), true
    assert_equal "Wagner".homophone?("Vagner"), true
    assert_equal "Mirela".homophone?("Mirella"), true
    assert_equal "Artur".homophone?("Arthur"), true
    assert_equal "Diego".homophone?("Dyego"), true
    assert_equal "Felipe".homophone?("Phelipe"), true
    assert_equal "Filipe".homophone?("Felipe"), true
    assert_equal "Phelipe".homophone?("Filipe"), true
    assert_equal "Philippe".homophone?("Felipe"), true
  end
  def test_use_vogals_option
    assert_equal "Helena".phonetize(:use_vogals => true), "ELMA"
  end
end
