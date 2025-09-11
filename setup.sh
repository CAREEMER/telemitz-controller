#!/bin/bash

set -e

echo "🚀 Setting up telemitz-controller..."

# Check if config.json exists
if [ ! -f "config.json" ]; then
    echo "❌ config.json not found!"
    echo "Please create config.json with your environment variables."
    echo "Example format:"
    echo '{'
    echo '  "DATABASE_URL": "your_database_url",'
    echo '  "API_KEY": "your_api_key",'
    echo '  "PORT": "3000"'
    echo '}'
    exit 1
fi

echo "📝 Converting config.json to .env..."

# Convert JSON to .env format
python3 -c "
import json
import sys

try:
    with open('config.json', 'r') as f:
        config = json.load(f)

    with open('.env', 'w') as f:
        for key, value in config.items():
            f.write(f'{key}={value}\n')

    print('✅ .env file created successfully')
except Exception as e:
    print(f'❌ Error: {e}')
    sys.exit(1)
"

echo "🔧 Making run.sh executable..."
chmod +x run.sh

echo "▶️  Starting application..."
./run.sh

echo "🎉 Setup complete!"
