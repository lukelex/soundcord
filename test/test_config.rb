# encoding: utf-8

require 'test/unit'
require 'soundcord/config'

class SoundCordTest < Test::Unit::TestCase
  def test_language_set_up
    %w(pt-BR en).each do |lang|
      SoundCord.load_language lang
      assert_equal lang, SoundCord.language
    end
  end
end