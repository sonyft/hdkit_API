#!/usr/bin/env ruby

# Test file for bodygraph validation
require_relative 'lib/bodygraphs_helper'

# Include the helper module
include BodygraphsHelper

puts "Testing Bodygraph Validation Function"
puts "=" * 50

# Test 1: Valid data
puts "\n1. Testing with valid data:"
valid_params = {
  name: "Test User",
  birth_date: "25/11/1996",
  birth_time: "11:49",
  birth_country: "Bulgaria (BG)",
  birth_city: "Sofia, Bulgaria",
  longitude: 23.3199889,
  latitude: 42.6813108
}

begin
  validate_bodygraph_params(valid_params)
  puts "✅ Valid data passed validation"
rescue StandardError => e
  puts "❌ Valid data failed validation: #{e.message}"
end

# Test 2: Missing required fields
puts "\n2. Testing with missing required fields:"
invalid_params_1 = {
  birth_date: "25/11/1996",
  birth_time: "11:49"
}

begin
  validate_bodygraph_params(invalid_params_1)
  puts "❌ Should have failed validation"
rescue StandardError => e
  puts "✅ Correctly caught validation error: #{e.message}"
end

# Test 3: Invalid date format
puts "\n3. Testing with invalid date format:"
invalid_params_2 = {
  name: "Test User",
  birth_date: "1996-11-25",  # Wrong format
  birth_time: "11:49",
  birth_country: "Bulgaria (BG)",
  birth_city: "Sofia, Bulgaria"
}

begin
  validate_bodygraph_params(invalid_params_2)
  puts "❌ Should have failed validation"
rescue StandardError => e
  puts "✅ Correctly caught validation error: #{e.message}"
end

# Test 4: Invalid time format
puts "\n4. Testing with invalid time format:"
invalid_params_3 = {
  name: "Test User",
  birth_date: "25/11/1996",
  birth_time: "11.49",  # Wrong format
  birth_country: "Bulgaria (BG)",
  birth_city: "Sofia, Bulgaria"
}

begin
  validate_bodygraph_params(invalid_params_3)
  puts "❌ Should have failed validation"
rescue StandardError => e
  puts "✅ Correctly caught validation error: #{e.message}"
end

# Test 5: Invalid latitude/longitude
puts "\n5. Testing with invalid coordinates:"
invalid_params_4 = {
  name: "Test User",
  birth_date: "25/11/1996",
  birth_time: "11:49",
  birth_country: "Bulgaria (BG)",
  birth_city: "Sofia, Bulgaria",
  latitude: 100,  # Invalid latitude
  longitude: 200  # Invalid longitude
}

begin
  validate_bodygraph_params(invalid_params_4)
  puts "❌ Should have failed validation"
rescue StandardError => e
  puts "✅ Correctly caught validation error: #{e.message}"
end

# Test 6: Invalid data types
puts "\n6. Testing with invalid data types:"
invalid_params_5 = {
  name: 123,  # Should be string
  birth_date: "25/11/1996",
  birth_time: "11:49",
  birth_country: "Bulgaria (BG)",
  birth_city: "Sofia, Bulgaria"
}

begin
  validate_bodygraph_params(invalid_params_5)
  puts "❌ Should have failed validation"
rescue StandardError => e
  puts "✅ Correctly caught validation error: #{e.message}"
end

puts "\n" + "=" * 50
puts "Validation testing completed!"
