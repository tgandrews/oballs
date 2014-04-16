class StatsGenerator
  def initialize(graph: nil, seed: Random.new_seed)
    if graph.nil?
      raise "An application graph must be provided"
    end
    @random = Random.new(seed)
    @app_graph = graph
  end

  def generate(session_count: 1)
    #current_location = 'home'
    [[]]
  end

  private
  STARTING_POINT = 'home'
end
