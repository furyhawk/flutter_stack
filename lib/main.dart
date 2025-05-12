import 'package:flutter/material.dart';
import 'package:flutter_stack/core/config/app_config.dart';
import 'package:flutter_stack/core/di/service_locator.dart';
import 'package:flutter_stack/core/network/api_client_provider.dart';
import 'package:flutter_stack/core/theme/app_theme.dart';
import 'package:flutter_stack/data/repositories/item_repository.dart';
import 'package:flutter_stack/data/repositories/user_repository.dart';
import 'package:flutter_stack/domain/services/auth_service.dart';
import 'package:flutter_stack/domain/usecases/auth_usecases.dart';
import 'package:flutter_stack/domain/usecases/item_usecases.dart';
import 'package:flutter_stack/presentation/navigation/app_router.dart';
import 'package:flutter_stack/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize app configuration
  AppConfig.initialize(environment: Environment.staging);
  
  // Initialize dependencies
  _initDependencies();
  
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
  
  serviceLocator.registerSingleton<LoginUseCase>(
    () => LoginUseCase(serviceLocator.get<UserRepository>()),
  );
  
  serviceLocator.registerSingleton<RegisterUseCase>(
    () => RegisterUseCase(serviceLocator.get<UserRepository>()),
  );
  
  serviceLocator.registerSingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(serviceLocator.get<UserRepository>()),
  );
  
  // Register services
  serviceLocator.registerSingleton<AuthService>(
    () => AuthService(
      loginUseCase: serviceLocator.get<LoginUseCase>(),
      registerUseCase: serviceLocator.get<RegisterUseCase>(),
      getCurrentUserUseCase: serviceLocator.get<GetCurrentUserUseCase>(),
      apiClientProvider: serviceLocator.get<ApiClientProvider>(),
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
