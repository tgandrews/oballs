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


application_graph = ApplicationGraphCreator.create
application_graph.write_to_graphic_file('jpg', 'app_graph')

# stat_generator = StatsGenerator.new(application_graph)
# stat_generator.generate number_of_sessions: 10_000
