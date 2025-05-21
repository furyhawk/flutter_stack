import 'package:flutter/material.dart';
import 'package:flutter_stack/core/network/api_client_provider.dart';
import 'package:flutter_stack/data/repositories/item_repository.dart';
import 'package:flutter_stack/data/repositories/user_repository.dart';

/// Service locator for dependency injection
class ServiceLocator {
  ServiceLocator._();
  
  static final ServiceLocator _instance = ServiceLocator._();
  static ServiceLocator get instance => _instance;
  
  final Map<Type, dynamic> _dependencies = {};
  
  T get<T>() {
    final instance = _dependencies[T];
    if (instance == null) {
      throw Exception('Dependency of type $T not registered');
    }
    return instance as T;
  }
  
  void register<T>(T instance) {
    _dependencies[T] = instance;
  }
  
  void registerSingleton<T>(T Function() factory) {
    if (!_dependencies.containsKey(T)) {
      _dependencies[T] = factory();
    }
  }
  
  void registerLazySingleton<T>(T Function() factory) {
    register<T Function()>(() {
      T? instance;
      return () {
        instance ??= factory();
        return instance!;
      };
    }());
  }
}

/// Initializes all dependencies
void initDependencies() {
  final serviceLocator = ServiceLocator.instance;
  
  // Register API client provider
  serviceLocator.registerSingleton<ApiClientProvider>(() => ApiClientProvider());
  
  // Register repositories
  serviceLocator.registerSingleton<ItemRepository>(
    () => ItemRepository(serviceLocator.get<ApiClientProvider>()),
  );
  
  serviceLocator.registerSingleton<UserRepository>(
    () => UserRepository(serviceLocator.get<ApiClientProvider>()),
  );
}

/// Widget that provides access to the service locator
class ServiceLocatorProvider extends InheritedWidget {
  final ServiceLocator serviceLocator;
  
  const ServiceLocatorProvider({
    super.key,
    required this.serviceLocator,
    required super.child,
  });
  
  static ServiceLocator of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ServiceLocatorProvider>();
    if (provider == null) {
      throw Exception('No ServiceLocatorProvider found in context');
    }
    return provider.serviceLocator;
  }
  
  @override
  bool updateShouldNotify(ServiceLocatorProvider oldWidget) {
    return serviceLocator != oldWidget.serviceLocator;
  }
}
