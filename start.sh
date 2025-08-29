#!/bin/bash

echo "Starting HDKit API..."

# Check if Ruby is installed
if ! command -v ruby &> /dev/null; then
    echo "Error: Ruby is not installed. Please install Ruby 3.0+ first."
    exit 1
fi

# Check if Bundler is installed
if ! command -v bundle &> /dev/null; then
    echo "Installing Bundler..."
    gem install bundler
fi

# Install dependencies
echo "Installing dependencies..."
bundle install

# Start the API
echo "Starting API on http://localhost:4567"
echo "Press Ctrl+C to stop"
ruby app.rb
