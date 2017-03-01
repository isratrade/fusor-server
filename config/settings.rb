root = File.expand_path(File.dirname(__FILE__) + "/..")
require 'yaml'
require "#{root}/lib/fusor/version"

settings_file = 'config/fusor.yaml'

SETTINGS = YAML.load_file("#{root}/#{settings_file}")
SETTINGS[:version] = Fusor::VERSION

# Load plugin config, if any
# Dir["#{root}/config/settings.plugins.d/*.yaml"].each do |f|
#   SETTINGS.merge! YAML.load_file f
# end
