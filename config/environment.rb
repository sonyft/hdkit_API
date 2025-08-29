# Environment configuration for HDKit API

# Set environment
ENV['RACK_ENV'] ||= 'development'

# Load required gems
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

# Load application files
require_relative '../app/application'
