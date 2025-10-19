#!/bin/bash

# Start both projects with Docker Compose

echo "🚀 Starting HDKit API and Rails Frontend with Docker Compose..."

# Copy environment file
if [ ! -f .env ]; then
    echo "📋 Creating .env file from template..."
    cp env.docker .env
    echo "⚠️  Please update RAILS_MASTER_KEY in .env file"
fi

# Build and start services
echo "🔨 Building and starting services..."
docker-compose up --build -d

echo "✅ Services started!"
echo ""
echo "📱 Access points:"
echo "   - HDKit API: http://localhost:4567"
echo "   - Rails Frontend: http://localhost:3001"
echo ""
echo "📊 To view logs:"
echo "   docker-compose logs -f"
echo ""
echo "🛑 To stop services:"
echo "   docker-compose down"
