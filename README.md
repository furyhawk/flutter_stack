# Flutter Stack

A modern Flutter project with API client generation capabilities that follows best practices.

## Overview

This project demonstrates a Flutter application with integrated OpenAPI client generation. It uses a variety of modern Flutter packages and tools including:

- JSON serialization with `json_annotation` and `freezed`
- API client generation with OpenAPI Generator
- HTTP requests using `dio`
- Secure storage with `flutter_secure_storage`
- Testing with `mockito` and `http_mock_adapter`

## Features

- Authentication (login, registration, and profile management)
- Item management (create, read, update, and delete items)
- Weather information display
- Secure storage for authentication tokens
- Theme support (light and dark)
- Clean architecture pattern

## Architecture

The application follows a clean architecture approach with the following layers:

- **Presentation**: UI components (screens, widgets)
- **Domain**: Business logic and models
- **Data**: Repositories and data sources

### Project Structure

```
lib/
  ├── core/            # Core functionality
  │   ├── api/         # API-related code
  │   ├── theme/       # Theming
  │   └── utils/       # Utilities
  ├── features/        # Application features
  │   ├── auth/        # Authentication feature
  │   ├── items/       # Items management
  │   ├── profile/     # User profile
  │   └── weather/     # Weather information
  ├── app.dart         # Main app widget
  └── main.dart        # Application entry point
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
