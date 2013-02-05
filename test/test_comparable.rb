# encoding: utf-8

require 'test/unit'
require 'soundcord'

module SoundCord
  class ComparableTest < Test::Unit::TestCase
    def test_comparing_equals
      assert_equal Word.new('lukas') == Word.new('lucas'), true
    end
    def test_comparing_differents
      assert_equal Word.new('lukas') != Word.new('Maria'), true
    end
  end
end