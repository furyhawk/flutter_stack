# Flutter Stack

A modern Flutter project with API client generation capabilities.

## Overview

This project demonstrates a Flutter application with integrated OpenAPI client generation. It uses a variety of modern Flutter packages and tools including:

- JSON serialization with `json_annotation` and `freezed`
- API client generation with OpenAPI Generator
- HTTP requests using `dio`
- Testing with `mockito` and `http_mock_adapter`

## Project Structure

```
flutter_stack/
├── api/                  # Generated API client code
├── lib/                  # Application source code
├── scripts/              # Utility scripts
│   └── generate_api.sh   # API client generation script
└── pubspec.yaml          # Dependencies and configuration
```

## API Client Generation

This project uses OpenAPI Generator to create a Dart client for API interactions.

### Generating the API Client

To generate the API client:

```bash
./scripts/generate_api.sh
```

This script will:
1. Automatically disable the `api_client` dependency in pubspec.yaml
2. Clean any previous generated files
3. Generate a new API client from the OpenAPI specification
4. Run build_runner for any additional code generation

### Using the Generated API Client

After generating the API client, you need to uncomment the dependency in pubspec.yaml:

```yaml
dependencies:
  # ...other dependencies
  api_client:
    path: api/api_client
```

Or run the provided command in the terminal (displayed after running the generation script).

## Development

### Requirements

- Flutter SDK ^3.7.2
- Dart SDK
- Node.js and npm (for OpenAPI Generator)

### Setup

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Generate the API client using the script
4. Run the application with `flutter run`

## Testing

```bash
flutter test
```
