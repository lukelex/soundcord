# encoding: utf-8

require 'test/unit'
require 'soundcord'

class SoundCordTest < Test::Unit::TestCase
  # pt-BR
  def test_simple_words_pt_br
    SoundCord.load_language 'pt-BR'

    assert_equal "J", "João".phonetize
    assert_equal "MR", "Maria".phonetize
    assert_equal "LM", "Helena".phonetize
    assert_equal "VLM", "Valmir".phonetize
    assert_equal "VLM", "Walmir".phonetize
  end
  def test_simple_comparisons_pt_br
    SoundCord.load_language 'pt-BR'

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
  def test_special_chars_pt_br
    SoundCord.load_language 'pt-BR'

    assert_equal true, "Luçia".homophone?("lucia")
    assert_equal true, "Lúcio".homophone?("lucio")
  end
  def test_find_in_collection_pt_br
    SoundCord.load_language 'pt-BR'

    list = %w( saola paulo saulo ricardo sallo )
    expected = %w( saola saulo sallo )
    assert_equal expected, list.homophones("saulo")
    list = %w( leonardo lucene rodrigo luciana lussene )
    expected = %w( lucene luciana lussene )
    assert_equal expected, list.homophones("lucene")
  end

  # en
  def test_initiations_en
    SoundCord.load_language 'en'

    assert_equal "RL", "aerial".phonetize
    assert_equal "RP", "wrap".phonetize
    assert_equal "SN", "xeno".phonetize
    assert_equal "WTFR", "whatever".phonetize
    assert_equal "NM", "gnome".phonetize
    assert_equal "NF", "knife".phonetize
    assert_equal "NMNK", "pneumonic".phonetize
  end

  def test_unusual_combinations_en
    SoundCord.load_language 'en'

    assert_equal "0TR", "theater".phonetize
    assert_equal "TX", "touch".phonetize
    assert_equal "XL", "shell".phonetize
    assert_equal "KRX", "crutch".phonetize
    assert_equal "FS", "phase".phonetize
    assert_equal "BKR", "beggar".phonetize
  end

  def test_terminations_en
    SoundCord.load_language 'en'

    assert_equal "LM", "lmb".phonetize
  end

  def test_middle_en
    SoundCord.load_language 'en'

    # couldn't remember a better word with SCH in the middle
    assert_equal "PRSK", "porsche".phonetize
  end

  def test_duplicate_exceptions_en
    SoundCord.load_language 'en'

    assert_equal "GKLS", "goggles".phonetize
  end

  def test_special_chars_en
    SoundCord.load_language 'en'

    assert_equal true, "Qeyla".homophone?("keyla")
    assert_equal true, "Courtiney".homophone?("kourtiney")
    assert_equal true, "Quartz".homophone?("kuarts")
    assert_equal true, "falue".homophone?("value")
    assert_equal true, "data".homophone?("tada")
  end
end
