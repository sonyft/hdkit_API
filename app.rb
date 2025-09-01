require 'sinatra'
require 'sinatra/json'
require 'json'
require_relative 'lib/bodygraphs_helper'
require_relative 'lib/hdkit'
require_relative 'lib/bodygraph_data'

class HdkitAPI < Sinatra::Base
  include BodygraphsHelper

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

  # Health check endpoint
  get '/' do
    json({ status: 'OK', message: 'HDKit API is running' })
  end

  # Main endpoint for generating bodygraph
  post '/api/bodygraph' do
    content_type :json

    begin
      # Parse JSON request body
      request_payload = JSON.parse(request.body.read)

      # Convert string keys to symbols for the helper method
      params = request_payload.transform_keys(&:to_sym)

      # Generate bodygraph (validation happens inside build_bodygraph)
      bodygraph = build_bodygraph(params)

      # Convert to hash and return JSON
      bodygraph_hash = {
        name: bodygraph.name,
        birth_date: bodygraph.birth_date,
        birth_time: bodygraph.birth_time,
        birth_country: bodygraph.birth_country,
        birth_city: bodygraph.birth_city,
        latitude: bodygraph.latitude,
        longitude: bodygraph.longitude,
        timezone: bodygraph.timezone,
        birth_date_utc: bodygraph.birth_date_utc&.iso8601,
        design_date_utc: bodygraph.design_date_utc&.iso8601,
        aura_type: bodygraph.aura_type,
        inner_authority: bodygraph.inner_authority,
        definition: bodygraph.definition,
        profile: bodygraph.profile,
        incarnation_cross: bodygraph.incarnation_cross,
        cognition: bodygraph.cognition,
        sense: bodygraph.sense,
        variable: bodygraph.variable,
        determination: bodygraph.determination,
        environment: bodygraph.environment,
        view: bodygraph.view,
        motivation: bodygraph.motivation,
        personality_activations: JSON.parse(bodygraph.personality_activations),
        design_activations: JSON.parse(bodygraph.design_activations),
        head_defined: bodygraph.head_defined,
        ajna_defined: bodygraph.ajna_defined,
        throat_defined: bodygraph.throat_defined,
        spleen_defined: bodygraph.spleen_defined,
        solar_plexus_defined: bodygraph.solar_plexus_defined,
        g_center_defined: bodygraph.g_center_defined,
        sacral_defined: bodygraph.sacral_defined,
        root_defined: bodygraph.root_defined,
        ego_defined: bodygraph.ego_defined,
        personality_nodes_tone: bodygraph.personality_nodes_tone,
        design_nodes_tone: bodygraph.design_nodes_tone,
        all_activated_gates: bodygraph.all_activated_gates
      }

      json(bodygraph_hash)

    rescue JSON::ParserError => e
      status 400
      json({ error: 'Invalid JSON format', details: e.message })
    rescue StandardError => e
      # Check if it's a validation error
      if e.message.include?('Validation errors:')
        status 400
        json({ error: 'Validation failed', details: e.message })
      else
        status 500
        json({ error: 'Internal server error', details: e.message })
      end
    end
  end

  # Error handlers
  error 404 do
    json({ error: 'Not found' })
  end

  error 500 do
    json({ error: 'Internal server error' })
  end
end
