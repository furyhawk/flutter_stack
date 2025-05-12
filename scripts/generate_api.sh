#!/bin/bash

# Script to generate API client code from OpenAPI specification

# API directory name variable
API_DIR="api_client"

echo "Generating API client code from OpenAPI spec..."
# Clean previous generated files
rm -rf api/$API_DIR

# Use the npm-installed openapi-generator-cli
echo "Running OpenAPI Generator..."
openapi-generator-cli generate \
  -i https://service.furyhawk.lol/api/v1/openapi.json \
  -g dart-dio \
  -o api/$API_DIR \
  --additional-properties=pubName=$API_DIR,pubAuthor=OpenAPI_Generator

# Run build_runner for any additional code generation in the generated API directory
echo "Running build_runner for additional code generation..."
cd api/$API_DIR
dart pub get
dart run build_runner build --delete-conflicting-outputs
cd ../..

echo "API client code generation completed!"
