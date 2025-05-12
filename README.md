# Flutter Stack

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
