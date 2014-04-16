require 'plexus'
require 'plexus/dot'
require 'irb'

class ApplicationGraphCreator
  def self.create
    Plexus::DirectedMultiGraph['home', 'categories', 'categories', 'home', 'categories', 'playback', 'playback', 'home', 'playback', 'categories']
  end
end
