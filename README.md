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
- **Weather Hub**: Comprehensive weather dashboard with Singapore weather data
  - Real-time weather overview
  - Multiple forecast types (2-hour, 24-hour, 4-day outlook)
  - Air temperature, lightning, and wind direction data
  - Interactive weather service cards
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



### Troubleshooting

#### Missing `libsecret-1` Dependency

If you encounter an error indicating that the `libsecret-1` package is missing, it is required by the `flutter_secure_storage_linux` plugin.

You can install it by running one of the following commands in your terminal, depending on your Linux distribution:

For Debian/Ubuntu-based distributions:
The CMake error indicates that the `libsecret-1` package, version 0.18.4 or higher, is missing. This is a dependency for the `flutter_secure_storage_linux` plugin.

Run the following command to install `libsecret-1-dev`, which should resolve the issue:
```
sudo apt-get update && sudo apt-get install -y libsecret-1-dev
```

### Setup

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Generate the API client using the script
4. Run the application with `flutter run`

## Testing

```bash
flutter test
=======
A scalable Flutter application architecture using the API Client package.

## Architecture Overview

This project follows a clean architecture approach with the following layers:

### Core Layer
- **config**: Application configuration such as environment settings
- **di**: Dependency injection using a simple service locator pattern
- **network**: API client setup and network utilities
- **theme**: Application theme definitions
- **utils**: Common utility functions

### Data Layer
- **datasources**: Data sources (local and remote)
- **repositories**: Implementation of data repositories

### Domain Layer
- **models**: Business logic models
- **usecases**: Use cases that encapsulate business logic
- **services**: Services that coordinate between multiple repositories

### Presentation Layer
- **blocs**: Business Logic Components for state management
- **screens**: UI screens
- **widgets**: Reusable UI components

## API Client Usage

The API client is a generated client based on OpenAPI specifications. It's integrated into the app using a provider pattern:

### 1. Create API Client Provider

```dart
// Create API client with proper configuration
final apiClientProvider = ApiClientProvider();

// Access specific API services
final itemsApi = apiClientProvider.itemsApi;
final usersApi = apiClientProvider.usersApi;
```

### 2. Use Repository Pattern

Repositories abstract away the data sources and handle API responses:

```dart
// Example repository method
Future<ApiResult<ItemsPublic>> getItems() {
  return safeApiCall(() => apiClientProvider.itemsApi.readItems());
}
```

### 3. Use Cases

Use cases encapsulate business logic:

```dart
// Example use case
final result = await getItemsUseCase.execute();
if (result.isSuccess) {
  // Handle success
} else {
  // Handle error
}
```

## Getting Started

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Environment Configuration

Configure different environments in `app_config.dart`:

- Development
- Staging
- Production

Switch environments in `main.dart`:

```dart
AppConfig.initialize(environment: Environment.dev);
```
