#!/bin/bash

# Example usage of the HDKit API with curl

echo "HDKit API Example Usage"
echo "======================="
echo ""

# Health check
echo "1. Health check:"
curl -s http://localhost:4567/ | jq .
echo ""

# Generate bodygraph
echo "2. Generate bodygraph:"
curl -X POST http://localhost:4567/api/bodygraph \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Иван Иванов",
    "birth_date": "25/11/1996",
    "birth_time": "11:48",
    "birth_country": "Bulgaria (BG)",
    "birth_city": "Sofia, Bulgaria"
  }' | jq .
echo ""

# Example with birth_date_local
echo "3. Generate bodygraph with birth_date_local:"
curl -X POST http://localhost:4567/api/bodygraph \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Мария Петрова",
    "birth_date": "15/03/1985",
    "birth_time": "14:30",
    "latitude": 42.1532,
    "longitude": 24.7535
  }' | jq .
echo ""

echo "Note: Make sure the API is running on localhost:4567"
echo "Install jq for better JSON formatting: brew install jq (macOS) or apt-get install jq (Ubuntu)"
