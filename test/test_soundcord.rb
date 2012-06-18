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
    assert_equal "Joao".compare_phonetically("João"), true
    assert_equal "Helena".compare_phonetically("Elena"), true
    assert_equal "Walmir".compare_phonetically("Valmir"), true
    assert_equal "Marria".compare_phonetically("Maria"), true
    assert_equal "Wagner".compare_phonetically("Vagner"), true
    assert_equal "Mirela".compare_phonetically("Mirella"), true
    assert_equal "Artur".compare_phonetically("Arthur"), true
    assert_equal "Diego".compare_phonetically("Dyego"), true
    assert_equal "Felipe".compare_phonetically("Phelipe"), true
    assert_equal "Filipe".compare_phonetically("Felipe"), true
    assert_equal "Phelipe".compare_phonetically("Filipe"), true
    assert_equal "Philippe".compare_phonetically("Felipe"), true
  end
  def test_use_vogals_option
    assert_equal "Helena".phonetize(:use_vogals => true), "ELMA"
  end
end
