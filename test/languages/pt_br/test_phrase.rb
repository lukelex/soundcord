# encoding: utf-8

require 'test/unit'
require 'soundcord'

module SoundCord
  class PtBrPhraseTest < Test::Unit::TestCase
    def setup
      SoundCord.load_language 'pt-BR'
    end

    def test_short_phrase
      short_phrase = 'Ser feliz sem motivo é a mais autêntica forma de felicidade.'
      expected_phrase = 'S FL S MTV M TMTK FM D FLSD.'

      assert_equal expected_phrase, short_phrase.phonetize
    end

    def test_medium_phrase
      medium_phrase = 'O amor é grande e cabe nesta janela sobre o mar. O mar é grande e cabe na cama e no colchão de amar. O amor é grande e cabe no breve espaço de beijar.'
      expected_phrase = 'M GMD KB MT JML SB M. M GMD KB M KM M KLS D M. M GMD KB M BV SPS D BJ.'

      assert_equal expected_phrase, medium_phrase.phonetize
    end

    def test_large_phrase
      large_phrase = 'A cada dia que vivo, mais me convenço de que o desperdício da vida está no amor que não damos, nas forças que não usamos, na prudência egoísta que nada arrisca e que, esquivando-nos do sofrimento, perdemos também a felicidade.'
      expected_phrase = 'KD D K V, M M KMVMS D K DSPRDíS D VD T M M K M DM, M FS K M SM, M PDMS GíT K MD RSK K, SKVMD-M D SFRMT, PRDM TMB FLSD.'

      assert_equal expected_phrase, large_phrase.phonetize
    end
  end
end