require_relative '../lib/application_graph_creator'
require 'minitest/autorun'


class ApplicationGraphCreatorTest < Minitest::Test
  def test_create_from_sessions_returns_graph
    graph = ApplicationGraphCreator.create_from_sessions
    refute_nil graph
  end

  def test_creates_graph_with_one_vertex
    sessions = [['home']]

    graph = ApplicationGraphCreator.create_from_sessions sessions: sessions

    vertices = graph.vertices

    assert_equal 1, vertices.length
    assert_equal 'home', vertices[0]
  end

  def test_creates_graph_with_multiple_vertices_and_one_edge
    sessions = [['home', 'categories']]

    graph = ApplicationGraphCreator.create_from_sessions sessions: sessions

    assert_equal ['home', 'categories'], graph.vertices
    assert_equal 1, graph.edges.length
    assert_equal true, graph.has_edge?('home', 'categories')
  end

  def test_creates_graph_with_multiple_vertices_and_looping_edge
    sessions = [['home', 'categories', 'home']]

    graph = ApplicationGraphCreator.create_from_sessions sessions: sessions
    assert_equal 2, graph.edges.length
    assert_equal true, graph.has_edge?('home', 'categories')
    assert_equal true, graph.has_edge?('categories', 'home')
  end
end
