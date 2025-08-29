#!/usr/bin/env ruby

require 'net/http'
require 'json'
require 'uri'

# Test the HDKit API
def test_api
  uri = URI('http://localhost:4567/api/bodygraph')

  # Test data
  test_data = {
    name: "Test User",
    birth_date: "25/11/1996",
    birth_time: "11:48",
    birth_country: "Bulgaria (BG)",
    birth_city: "Sofia, Bulgaria"
  }

  puts "Testing HDKit API..."
  puts "Endpoint: #{uri}"
  puts "Test data: #{test_data.to_json}"
  puts "-" * 50

  begin
    # Create HTTP request
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri)
    request['Content-Type'] = 'application/json'
    request.body = test_data.to_json

    # Send request
    response = http.request(request)

    puts "Response status: #{response.code}"
    puts "Response body:"
    puts JSON.pretty_generate(JSON.parse(response.body))

  rescue => e
    puts "Error: #{e.message}"
    puts "Make sure the API is running on localhost:4567"
  end
end

# Run test if this file is executed directly
if __FILE__ == $0
  test_api
end
