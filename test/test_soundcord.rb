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
    assert_equal true, "Joao".homophone?("João")
    assert_equal true, "Helena".homophone?("Elena")
    assert_equal true, "Walmir".homophone?("Valmir")
    assert_equal true, "Marria".homophone?("Maria")
    assert_equal true, "Wagner".homophone?("Vagner")
    assert_equal true, "Mirela".homophone?("Mirella")
    assert_equal true, "Artur".homophone?("Arthur")
    assert_equal true, "Diego".homophone?("Dyego")
    assert_equal true, "Felipe".homophone?("Phelipe")
    assert_equal true, "Filipe".homophone?("Felipe")
    assert_equal true, "Phelipe".homophone?("Filipe")
    assert_equal true, "Philippe".homophone?("Felipe")
  end
  def test_use_vogals_option
    assert_equal "ELEMA", "Helena".phonetize(:use_vogals => true)
  end
  def test_find_in_collection
    list = %w( saola paulo saulo ricardo sallo )
    expected = %w( saola saulo sallo )
    assert_equal expected, list.homophones("saulo")
    list = %w( leonardo lucene rodrigo luciana lussene )
    expected = %w( lucene luciana lussene )
    assert_equal expected, list.homophones("lucene")
  end
end
