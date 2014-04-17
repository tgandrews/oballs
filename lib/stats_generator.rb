class StatsGenerator
  def initialize(graph: nil, seed: Random.new_seed)
    if graph.nil?
      raise "An application graph must be provided"
    end
    @random = Random.new(seed)
    @app_graph = graph
  end

  def generate(session_count: 1, max_session_length: 5)
    sessions = []

    for i in 1..session_count
      session = ['home']
      current_location = STARTING_POINT

      for i in 1..(max_session_length - 1)
        possible_destinations = @app_graph.adjacent(current_location)
        possible_destinations.push 'exit'

        next_index = @random.rand possible_destinations.length

        next_location = possible_destinations[next_index]
        if next_location == 'exit'
          break
        end
        session.push next_location
        current_location = next_location
      end

      sessions.push session
    end

    sessions
  end

  private
  STARTING_POINT = 'home'
end
