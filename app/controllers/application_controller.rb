class ApplicationController < Sinatra::Base
  set :port, 4567
  set :bind, '0.0.0.0'

  # Enable CORS
  before do
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Content-Type"
  end

  options "*" do
    response.headers["Allow"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Content-Type"
    200
  end

  # Error handlers
  error 404 do
    json({ error: 'Not found' })
  end

  error 500 do
    json({ error: 'Internal server error' })
  end
end
