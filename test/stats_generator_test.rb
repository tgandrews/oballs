require_relative '../lib/stats_generator'
require_relative '../lib/application_graph_creator'
require 'minitest/autorun'


class StatsGeneratorTest < Minitest::Unit::TestCase
  def setup
    graph =  ApplicationGraphCreator.create
    @stats_generator = StatsGenerator.new(graph: graph, seed: 12345678911)
  end

  def test_creates_correct_number_of_sessions
    sessions = @stats_generator.generate
    assert_equal sessions.length, 1
  end

  def test_creates_example_session
    sessions = @stats_generator.generate
    first_session = sessions.first
    assert_equal ["home", "categories", "playback", "categories", "home"], first_session
  end

  def test_creates_three_example_sessions
    sessions = @stats_generator.generate session_count: 3

    second_session = sessions[1]
    assert_equal ["home", "categories", "home"], second_session

    third_session = sessions[2]
    assert_equal ["home"], third_session
  end
end
