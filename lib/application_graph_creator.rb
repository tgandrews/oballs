require 'plexus'
require 'plexus/dot'
require 'irb'

class ApplicationGraphCreator
  def self.create
    Plexus::Digraph['home', 'categories', 'categories', 'home', 'categories', 'playback', 'playback', 'home', 'playback', 'categories']
  end
end
