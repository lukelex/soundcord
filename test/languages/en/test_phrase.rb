# encoding: utf-8

require 'test/unit'
require 'soundcord'

module SoundCord
  class EnPhraseTest < Test::Unit::TestCase
    def setup
      SoundCord.load_language 'en'
    end

    def test_short_phrase
      short_phrase = 'Imagination is more important than knowledge.'
      expected_phrase = 'MJNXN S MR MPRTNT 0N NLJ.'

      assert_equal expected_phrase, short_phrase.phonetize
    end

    def test_medium_phrase
      medium_phrase = 'Too many of us look upon Americans as dollar chasers. This is a cruel libel, even if it is reiterated thoughtlessly by the Americans themselves.'
      expected_phrase = 'T MN F S LK PN MRKNS S TLR XSRS. 0S S KRL LBL, FN F T S RTRT 0GHTLSL B 0 MRKNS 0MSLFS.'

      assert_equal expected_phrase, medium_phrase.phonetize
    end

    def test_large_phrase
      large_phrase = 'He who joyfully marches to music rank and file, has already earned my contempt. He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. Heroism at command, how violently I hate all this, how despicable and ignoble war is; I would rather be torn to shreds than be a part of so base an action. It is my conviction that killing under the cloak of war is nothing but an act of murder.'
      expected_phrase = 'H JFL MRXS T MSK RNK NT FL, HS LRT RNT M KNTMPT. H HS BN JFN LRJ BRN B MSTK, SNS FR HM 0 SPNL KRT LT SRL SFS. 0S TSGRS T SFLSXN XLT B TN 0 T NS. HRSM T KMNT, H FLNTL HT L 0S, H TSPKBL NT GNBL R S; LT R0R B TRN T XRTS 0N B PRT F S BS N KXN. T S M KNFKXN 0T KLNG NTR 0 KLK F R S N0NG BT N KT F MRTR.'

      assert_equal expected_phrase, large_phrase.phonetize
    end
  end
end