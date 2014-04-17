require 'plexus'
require 'plexus/dot'
require 'irb'

class ApplicationGraphCreator
  def self.create_dummy
    Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home', 'categories', 'playback', 'playback', 'home', 'playback', 'categories']
  end

  def self.create_broken
Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home', 'categories', 'playback', 'playback', 'home']
  end

  def self.create_from_sessions(sessions: [])
    graph = Plexus::DirectedMultiGraph.new
    graph.add_vertex! 'home'

    for i in 0..(sessions.length - 1)
      session = sessions[i]

      current_point = 'home'
      for j in 1..(session.length - 1)
        end_point = session[j]

        if !graph.has_vertex?(end_point)
          graph.add_vertex! end_point
        end

        if !graph.has_edge? current_point, end_point
          graph.add_edge! current_point, end_point
        end
        current_point = end_point
      end
    end

    return graph
  end
end
