# encoding: utf-8

require 'test/unit'
require 'soundcord/integrations/array'

class SoundCordTest < Test::Unit::TestCase
  def test_homophones_method_existance
    assert_equal Array.new.respond_to?(:homophones), true
  end
end
