#!/bin/bash

# Script to generate API client code from OpenAPI specification

# API directory name variable
API_DIR="api_client"
# OpenAPI specification URL
OPENAPI_SPEC_URL="https://service.furyhawk.lol/api/v1/openapi.json" 

# Ensure the api_client dependency is commented out in pubspec.yaml before generation
echo "Ensuring $API_DIR dependency is disabled..."
sed -i.bak -E "s/^([[:space:]]+)$API_DIR:/\\1# $API_DIR:/" pubspec.yaml
sed -i.bak -E "s/^([[:space:]]+)path: api\\/$API_DIR/\\1# path: api\\/$API_DIR/" pubspec.yaml
rm -f pubspec.yaml.bak

echo "Generating API client code from OpenAPI spec..."
# Clean previous generated files
rm -rf api/$API_DIR
mkdir -p api/$API_DIR

# Check if npx is installed
if ! command -v npx &> /dev/null
then
    echo "npx could not be found. Please install Node.js and npm first."
    exit 1
fi

# Check if Dart SDK is installed
if ! command -v dart &> /dev/null
then
    echo "Dart SDK could not be found. Please install it first."
    exit 1
fi

# Use the npm-installed openapi-generator-cli
echo "Running OpenAPI Generator..."
npx @openapitools/openapi-generator-cli generate \\
  -i "$OPENAPI_SPEC_URL" \\
  -g dart-dio \\
  -o api/$API_DIR \\
  --additional-properties=pubName=$API_DIR,pubAuthor=OpenAPI_Generator

# Run build_runner for any additional code generation in the generated API directory
echo "Running build_runner for additional code generation..."
cd api/$API_DIR
dart pub get
dart run build_runner build --delete-conflicting-outputs
cd ../..

echo "API client code generation completed!"
echo ""
echo "To use the generated API client, uncomment the following lines in pubspec.yaml:"
echo "  $API_DIR:"
echo "    path: api/$API_DIR"
echo ""
echo "Or run this command to automatically enable it:"
echo "  sed -i.bak -E 's/^([[:space:]]+)# $API_DIR:/\\1$API_DIR:/' pubspec.yaml && sed -i.bak -E 's/^([[:space:]]+)# path: api\\/$API_DIR/\\1path: api\\/$API_DIR/' pubspec.yaml && rm -f pubspec.yaml.bak"
