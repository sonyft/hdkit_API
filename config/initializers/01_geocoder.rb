# Geocoder configuration
Geocoder.configure(
  api_key: ENV.fetch('GOOGLE_API_KEY', nil),
  timeout: 15,
  lookup: :google,
  use_https: true
)
