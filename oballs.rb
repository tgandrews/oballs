require 'rubygems'
require 'lib/stats_generator'

application_graph = ApplicationGraph.new

stat_generator = StatsGenerator.new(application_graph)
stat_generator.generate number_of_sessions: 10_000
