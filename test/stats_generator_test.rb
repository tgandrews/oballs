require_relative '../lib/stats_generator'
require 'minitest/autorun'


class StatGeneratorTest < Minitest::Unit::TestCase
  def test_init
    StatGenerator.new
    assert_equal true, true
  end
end
