#!/bin/bash

set -e

REPO_URL="https://github.com/CAREEMER/telemitz-controller.git"
PROJECT_NAME="telemitz-controller"

echo "📦 Cloning telemitz-controller..."

# Clone the repository
if [ -d "$PROJECT_NAME" ]; then
    echo "Directory $PROJECT_NAME already exists. Removing..."
    rm -rf "$PROJECT_NAME"
fi

git clone "$REPO_URL"
cd "$PROJECT_NAME"

echo "🔧 Setting up environment..."

# Check if user provided config.json as argument
if [ "$#" -eq 1 ] && [ -f "$1" ]; then
    cp "$1" config.json
    echo "✅ Using provided config file: $1"
else
    # Create template config.json
    echo "📋 Creating template config.json..."
    cat > config.json << 'EOF'
{
    "BACKEND_URL": "https://rashidmingazov.online",
    "BACKEND_LIVEKIT_WEBHOOK_ID": "",
    "REGISTRATION_TOKEN": "",
    "SELF_DOMAIN": "",
    "LIVEKIT_API_KEY": "",
    "LIVEKIT_API_SECRET": ""
}
EOF

    echo "⚠️  Please edit config.json with your actual values:"
    echo "   nano config.json"
    echo ""
    echo "Then run: ./setup.sh"
    exit 0
fi

# Run setup
chmod +x setup.sh
./setup.sh
