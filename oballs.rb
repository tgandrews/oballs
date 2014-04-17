require 'rubygems'
require 'bundler'

# Setup load paths
Bundler.require
$: << File.expand_path('../', __FILE__)
$: << File.expand_path('../lib', __FILE__)

libraries = Dir[File.expand_path('../lib/**/*.rb', __FILE__)]
libraries.each do |path_name|
  require path_name
end


puts 'Generating dummy app graph...'
working_application = ApplicationGraphCreator.create_dummy
working_application.write_to_graphic_file('jpg', 'dummy_app')
puts '...done'

puts 'Generating broken app graph...'
broken_application = ApplicationGraphCreator.create_broken
broken_application.write_to_graphic_file('jpg', 'broken_app')
puts '...done'

puts 'Generating stats from broken app graph...'
broken_app_stats_generator = StatsGenerator.new graph: broken_application
broken_sessions = broken_app_stats_generator.generate session_count: 10_000, max_session_length: 10
puts '...done'

puts 'Generating graph from broken app stats...'
broken_application_graph_from_stats = ApplicationGraphCreator.create_from_sessions sessions: broken_sessions
broken_application_graph_from_stats.write_to_graphic_file('jpg', 'broken_app_from_stats')
puts '...done'

# stat_generator = StatsGenerator.new(application_graph)
# stat_generator.generate number_of_sessions: 10_000
