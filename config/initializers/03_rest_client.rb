# RestClient configuration
require 'rest-client'

# Set timeout and other options
RestClient.log = 'stdout' if ENV['RACK_ENV'] == 'development'
