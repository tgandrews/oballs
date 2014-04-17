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

puts 'Generating stats from app graph...'
working_app_stats_generator = StatsGenerator.new graph: working_application
working_sessions = working_app_stats_generator.generate session_count: 10_000, max_session_length: 10
puts '...done'

puts 'Generating graph from dummy stats...'
working_application_from_stats = ApplicationGraphCreator.create_from_sessions sessions: working_sessions
working_application_from_stats.write_to_graphic_file('jpg', 'dummy_app_from_stats')
puts '...done'

# stat_generator = StatsGenerator.new(application_graph)
# stat_generator.generate number_of_sessions: 10_000
