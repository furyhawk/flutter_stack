import 'package:flutter/material.dart';
import 'package:flutter_stack/core/config/app_config.dart';
import 'package:flutter_stack/core/di/service_locator.dart';
import 'package:flutter_stack/core/network/api_client_provider.dart';
import 'package:flutter_stack/core/theme/app_theme.dart';
import 'package:flutter_stack/data/repositories/item_repository.dart';
import 'package:flutter_stack/data/repositories/user_repository.dart';
import 'package:flutter_stack/data/repositories/weather_repository.dart';
import 'package:flutter_stack/domain/services/services.dart';
import 'package:flutter_stack/domain/usecases/auth_usecases.dart';
import 'package:flutter_stack/domain/usecases/item_usecases.dart';
import 'package:flutter_stack/domain/usecases/weather_usecases.dart';
import 'package:flutter_stack/presentation/navigation/app_router.dart';
import 'package:flutter_stack/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize app configuration
  AppConfig.initialize(environment: Environment.staging);
  
  // Initialize dependencies
  _initDependencies();
  
  // Initialize preferences
  await ServiceLocator.instance.get<PreferencesService>().init();
  
  runApp(const MainApp());
}

void _initDependencies() {
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
  
  serviceLocator.registerSingleton<WeatherRepository>(
    () => WeatherRepository(serviceLocator.get<ApiClientProvider>()),
  );
  
  // Register use cases
  serviceLocator.registerSingleton<GetItemsUseCase>(
    () => GetItemsUseCase(serviceLocator.get<ItemRepository>()),
  );
  
  serviceLocator.registerSingleton<CreateItemUseCase>(
    () => CreateItemUseCase(serviceLocator.get<ItemRepository>()),
  );
  
  serviceLocator.registerSingleton<UpdateItemUseCase>(
    () => UpdateItemUseCase(serviceLocator.get<ItemRepository>()),
  );
  
  serviceLocator.registerSingleton<DeleteItemUseCase>(
    () => DeleteItemUseCase(serviceLocator.get<ItemRepository>()),
  );
  
  // Register Weather use cases
  serviceLocator.registerSingleton<GetSgTwoHourForecastUseCase>(
    () => GetSgTwoHourForecastUseCase(serviceLocator.get<WeatherRepository>()),
  );
  
  // Register login use cases
  serviceLocator.registerSingleton<LoginUseCase>(
    () => LoginUseCase(serviceLocator.get<UserRepository>()),
  );
  
  serviceLocator.registerSingleton<RegisterUseCase>(
    () => RegisterUseCase(serviceLocator.get<UserRepository>()),
  );
  
  serviceLocator.registerSingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(serviceLocator.get<UserRepository>()),
  );
  
  // Register basic services
  serviceLocator.registerSingleton<PreferencesService>(
    () => PreferencesService(),
  );
  
  serviceLocator.registerSingleton<LocationService>(
    () => LocationService(),
  );
  
  // Register domain services
  serviceLocator.registerSingleton<AuthService>(
    () => AuthService(
      loginUseCase: serviceLocator.get<LoginUseCase>(),
      registerUseCase: serviceLocator.get<RegisterUseCase>(),
      getCurrentUserUseCase: serviceLocator.get<GetCurrentUserUseCase>(),
      apiClientProvider: serviceLocator.get<ApiClientProvider>(),
    ),
  );

  serviceLocator.registerSingleton<WeatherService>(
    () => WeatherService(
      getSgTwoHourForecastUseCase: serviceLocator.get<GetSgTwoHourForecastUseCase>(),
      locationService: serviceLocator.get<LocationService>(),
    ),
  );

  serviceLocator.registerSingleton<ItemService>(
    () => ItemService(
      createItemUseCase: serviceLocator.get<CreateItemUseCase>(),
      getItemsUseCase: serviceLocator.get<GetItemsUseCase>(),
      updateItemUseCase: serviceLocator.get<UpdateItemUseCase>(),
      deleteItemUseCase: serviceLocator.get<DeleteItemUseCase>(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>.value(
          value: ServiceLocator.instance.get<AuthService>(),
        ),
        Provider<ItemService>.value(
          value: ServiceLocator.instance.get<ItemService>(),
        ),
        ChangeNotifierProvider<WeatherService>.value(
          value: ServiceLocator.instance.get<WeatherService>(),
        ),
        ChangeNotifierProvider<PreferencesService>.value(
          value: ServiceLocator.instance.get<PreferencesService>(),
        ),
        Provider<LocationService>.value(
          value: ServiceLocator.instance.get<LocationService>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Stack',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRouter.generateRoute,
        home: const AuthGuard(child: HomeScreen()),
      ),
    );
  }
}
