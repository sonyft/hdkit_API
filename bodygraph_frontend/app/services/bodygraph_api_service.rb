class BodygraphApiService
  include HTTParty

  base_uri 'http://localhost:4567'

  def self.generate_bodygraph(params)
    begin
      response = post('/api/bodygraph', {
        body: params.to_json,
        headers: {
          'Content-Type' => 'application/json'
        }
      })

      if response.success?
        response.parsed_response
      else
        raise "API Error: #{response.code} - #{response.message}"
      end
    rescue => e
      Rails.logger.error "Bodygraph API Error: #{e.message}"
      raise e
    end
  end

  def self.health_check
    begin
      response = get('/')
      response.success?
    rescue => e
      Rails.logger.error "API Health Check Error: #{e.message}"
      false
    end
  end
end
