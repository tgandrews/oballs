
class GraphComparitor
  def self.compare(graph_a: nil, graph_b: nil)
    results = []

    edges_a = graph_a.edges
    edges_b = graph_b.edges

    for edge_a in edges_a
      if !self.edges_include_edge(edges_b, edge_a)
        results.push("Missing edge between #{edge_a[0]} and #{edge_a[1]}")
      end
    end

    for edge_b in edges_b
      if !self.edges_include_edge(edges_a, edge_b)
        results.push("New edge between #{edge_b[0]} and #{edge_b[1]}")
      end
    end

    vertices_a = graph_a.vertices
    vertices_b = graph_b.vertices

    for vertex_a in vertices_a
      if !vertices_b.include? vertex_a
        results.push("Missing vertex #{vertex_a}")
      end
    end

    for vertex_b in vertices_b
      if !vertices_a.include? vertex_b
        results.push("New vertex #{vertex_b}")
      end
    end

    results
  end

  private
  def self.edges_include_edge(edges, edge)
    for i in 0..(edges.length - 1)
      current_edge = edges[i]
      if (edge[0] == current_edge[0]) && (edge[1] == current_edge[1])
        return true
      end
    end
    return false
  end
end
