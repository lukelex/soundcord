# encoding: utf-8

require "benchmark"
require 'test/unit'
require 'soundcord'

class SoundCordTest < Test::Unit::TestCase
  def test_with_100_words
    list_of_random_words = []
    100.times do
      list_of_random_words << (0...8).map{65.+(rand(25)).chr}.join
    end
    time = Benchmark.measure do
      list_of_random_words.each { |i| i.phonetize }
    end
    assert_block do
      time.real < 0.5
    end
  end
end