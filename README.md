# HDKit API

This is an API for generating Human Design bodygraph data, based on the original HDKit project. The API is built with Ruby using the Sinatra framework and provides an endpoint for generating complete bodygraph data.

## 🚀 Quick Start

### 1. Install Dependencies

```bash
cd hdkit_API
bundle install
```

### 2. Start the API

```bash
# Option 1: Rack (recommended)
bundle exec rackup --host 0.0.0.0 --port 4567

# Option 2: Using the startup script
./start.sh

# Option 3: With Docker
docker-compose up --build
```

The API will start on `http://localhost:4567`

## 📋 Requirements

- **Ruby 3.0+** - main programming language
- **Bundler** - for dependency management
- **Google API Key** (optional) - for geocoding and time zones

## 🔧 Configuration

### Google API Key (optional)

To work properly with geocoding and time zones, set the `GOOGLE_API_KEY` environment variable:

```bash
export GOOGLE_API_KEY="your_google_api_key_here"
```

**Note:** If you don't have a Google API key, the API will use default coordinates for Malden, MA, USA.

## 📡 API Endpoints

### Health Check
```
GET /
```
Checks if the API is working.

### Generate Bodygraph
```
POST /api/bodygraph
```

#### Required parameters:
- `name` - person's name
- `birth_date` - birth date (format: DD/MM/YYYY)
- `birth_time` - birth time (format: HH:MM)

### One of the following pairs (choose one):
- `birth_country` - country of birth
- `birth_city` - city of birth

##### OR

- `latitude`
- `longitude`

<!-- #### Optional parameters:
- `birth_date_local` - local birth date and time (format: YYYY-MM-DDTHH:MM) -->

## 📝 Usage Examples

### cURL
```bash
curl -X POST http://localhost:4567/api/bodygraph \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "birth_date": "25/11/1996",
    "birth_time": "11:48",
    "birth_country": "Bulgaria (BG)",
    "birth_city": "Sofia, Bulgaria"
  }'
```

### Python
```python
import requests

response = requests.post('http://localhost:4567/api/bodygraph', json={
    "name": "John Doe",
    "birth_date": "25/11/1996",
    "birth_time": "11:48",
    "birth_country": "Bulgaria (BG)",
    "birth_city": "Sofia, Bulgaria"
})

print(response.json())
```

### JavaScript/Node.js
```javascript
const response = await fetch('http://localhost:4567/api/bodygraph', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
        name: "John Doe",
        birth_date: "25/11/1996",
        birth_time: "11:48",
        birth_country: "Bulgaria (BG)",
        birth_city: "Sofia, Bulgaria"
    })
});

const data = await response.json();
console.log(data);
```

## 🧪 Testing

### Ruby test
```bash
ruby test_api.rb
```

### Examples in the examples/ folder
```bash
# cURL example
./examples/curl_example.sh

# Python example
python3 examples/python_example.py

# JavaScript example
node examples/javascript_example.js
```

## 🐳 Docker

### Using Docker Compose
```bash
docker-compose up --build
```

### Manual Docker image build
```bash
docker build -t hdkit-api .
docker run -p 4567:4567 hdkit-api
```

## 📊 Sample Response

```json
{
  "name": "John Doe",
  "birth_date": "25/11/1996",
  "birth_time": "11:48",
  "birth_country": "Bulgaria (BG)",
  "birth_city": "Sofia, Bulgaria",
  "latitude": 42.6977,
  "longitude": 23.3219,
  "timezone": "Europe/Sofia",
  "birth_date_utc": "1996-11-25T09:48:00Z",
  "design_date_utc": "1996-08-21T09:48:00Z",
  "aura_type": "Generator",
  "inner_authority": "Sacral",
  "definition": "Single",
  "profile": "1/3",
  "incarnation_cross": "Right Angle Cross of the Sphinx",
  "cognition": "Smell",
  "sense": "Security",
  "variable": "PLR DLR",
  "determination": "Appetite",
  "environment": "Caves",
  "view": "Survival",
  "motivation": "Fear",
  "personality_activations": { ... },
  "design_activations": { ... },
  "head_defined": true,
  "ajna_defined": true,
  "throat_defined": true,
  "spleen_defined": false,
  "solar_plexus_defined": false,
  "g_center_defined": true,
  "sacral_defined": true,
  "root_defined": false,
  "ego_defined": false,
  "personality_nodes_tone": 4,
  "design_nodes_tone": 2,
  "all_activated_gates": [41, 31, 19, 13, 49, 30, 55, 37, 63, 22, 36, 25, 17]
}
```

## 🔍 CORS

The API supports CORS and can be used from web applications without restrictions.

## 📚 Dependencies

- **`sinatra`** - web framework
- **`swe4r`** - Swiss Ephemeris for astronomical calculations
- **`geocoder`** - for city geocoding
- **`rest-client`** - for HTTP requests to Google APIs
- **`json`** - for JSON processing
- **`puma`** - web server

## 🛠️ Development

### Project Structure
```
hdkit_API/
├── app.rb                 # Main API file
├── config.ru             # Rack configuration
├── Gemfile               # Ruby dependencies
├── lib/                  # Library files
│   ├── bodygraphs_helper.rb  # Main bodygraph logic
│   ├── hdkit.rb             # HDKit class
│   └── bodygraph_data.rb    # BodygraphData class
├── examples/             # Usage examples
├── Dockerfile            # Docker configuration
├── docker-compose.yml    # Docker Compose configuration
└── README.md             # This documentation
```

### Adding New Endpoints

1. Open `app.rb`
2. Add new route
3. Implement the logic
4. Test with `test_api.rb`

## 🚨 Troubleshooting

### Problem: "Could not find gem 'swe4r'"
```bash
gem install swe4r
bundle install
```

### Problem: "Permission denied" when starting
```bash
chmod +x start.sh
```

### Problem: Port 4567 is busy
Change the port in `app.rb`:
```ruby
set :port, 4568  # or another free port
```

## 📞 Support

For questions or issues, check:
1. Ruby version (must be 3.0+)
2. Whether all dependencies are installed
3. Whether port 4567 is free
4. Console logs for errors

## 📄 License

This project is based on the original HDKit project and follows the same license terms.
