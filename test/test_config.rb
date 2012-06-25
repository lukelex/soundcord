# encoding: utf-8

require 'test/unit'
require 'config'

class SoundCordTest < Test::Unit::TestCase
  def test_language_set_up
    SoundCord.load_language "pt-BR"
    assert_equal "pt-BR", SoundCord.language
  end
  def test_language_set_up
    SoundCord.load_language "en"
    assert_equal "en", SoundCord.language
  end
end
