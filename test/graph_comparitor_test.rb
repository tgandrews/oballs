require_relative '../lib/graph_comparitor'
require 'plexus'
require 'minitest/autorun'


class GraphComparitorTest < Minitest::Test
  def test_compare_when_the_same
    working_app =  Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home', 'categories', 'playback', 'playback', 'home', 'playback', 'categories']
    results = GraphComparitor.compare graph_a: working_app, graph_b: working_app

    assert_equal 0, results.length
  end

  def test_compare_missing_edge
    working_app = Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home', 'categories', 'playback', 'playback', 'home', 'playback', 'categories']
    broken_app = Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'playback', 'playback', 'home', 'playback', 'categories']

    results = GraphComparitor.compare graph_a: working_app, graph_b: broken_app

    assert_equal 1, results.length
    assert_equal 'Missing edge between categories and home', results[0]
  end

  def test_compare_new_edge
    working_app = Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'playback', 'playback', 'home', 'playback', 'categories']
    broken_app = Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home', 'categories', 'playback', 'playback', 'home', 'playback', 'categories']

    results = GraphComparitor.compare graph_a: working_app, graph_b: broken_app

    assert_equal 1, results.length
    assert_equal 'New edge between categories and home', results[0]
  end

  def test_compare_missing_vertex
    working_app =  Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home', 'categories', 'playback']
    broken_app =  Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home']

    results = GraphComparitor.compare graph_a: working_app, graph_b: broken_app

    assert_equal 2, results.length
    assert_equal 'Missing vertex playback', results[1]
  end

  def test_compare_new_vertex
    working_app =  Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home', 'categories', 'playback', 'playback', 'home', 'playback', 'categories']
    broken_app = Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home', 'categories', 'playback', 'playback', 'home', 'playback', 'categories', 'playback', 'new_vertex']

    results = GraphComparitor.compare graph_a: working_app, graph_b: broken_app

    assert_equal 2, results.length
    assert_equal 'New vertex new_vertex', results[1]
  end
end
