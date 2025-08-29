require 'sinatra'
require 'sinatra/json'
require 'json'
require_relative '../lib/bodygraphs_helper'
require_relative '../lib/hdkit'
require_relative '../lib/bodygraph_data'
require_relative 'controllers/application_controller'
require_relative 'controllers/bodygraphs_controller'

# Main application class
class HdkitAPI < Sinatra::Base
  # Load all controllers
  use BodygraphsController
end
