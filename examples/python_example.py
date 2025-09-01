#!/usr/bin/env python3
"""
Python example for using the HDKit API
"""

import requests
import json

# API base URL
BASE_URL = "http://localhost:4567"

def test_health_check():
    """Test the health check endpoint"""
    print("1. Health Check")
    print("-" * 30)

    try:
        response = requests.get(f"{BASE_URL}/")
        print(f"Status: {response.status_code}")
        print(f"Response: {response.json()}")
    except Exception as e:
        print(f"Error: {e}")
    print()

def generate_bodygraph():
    """Generate a bodygraph"""
    print("2. Generate Bodygraph")
    print("-" * 30)

    data = {
        "name": "Иван Иванов",
        "birth_date": "25/11/1996",
        "birth_time": "11:48",
        "birth_country": "Bulgaria (BG)",
        "birth_city": "Sofia, Bulgaria"
    }

    try:
        response = requests.post(
            f"{BASE_URL}/api/bodygraph",
            json=data,
            headers={"Content-Type": "application/json"}
        )
        print(f"Status: {response.status_code}")
        print("Response:")
        print(json.dumps(response.json(), indent=2, ensure_ascii=False))
    except Exception as e:
        print(f"Error: {e}")
    print()

def generate_bodygraph_with_local_time():
    """Generate a bodygraph with local time"""
    print("3. Generate Bodygraph with Local Time")
    print("-" * 30)

    data = {
        "name": "Мария Петрова",
        "birth_date": "15/03/1985",
        "birth_time": "14:30",
        "latitude": 42.1532,
        "longitude": 24.7535
    }

    try:
        response = requests.post(
            f"{BASE_URL}/api/bodygraph",
            json=data,
            headers={"Content-Type": "application/json"}
        )
        print(f"Status: {response.status_code}")
        print("Response:")
        print(json.dumps(response.json(), indent=2, ensure_ascii=False))
    except Exception as e:
        print(f"Error: {e}")
    print()

if __name__ == "__main__":
    print("HDKit API Python Example")
    print("=" * 40)
    print()

    test_health_check()
    generate_bodygraph()
    generate_bodygraph_with_local_time()

    print("Note: Make sure the API is running on localhost:4567")
    print("Install requests: pip install requests")
