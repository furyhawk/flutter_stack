import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stack/app.dart';
import 'package:flutter_stack/core/utils/service_locator.dart';
import 'package:flutter_stack/features/auth/domain/auth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  
  // Initialize the service locator
  ServiceLocator.init();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(ServiceLocator.authRepository),
        ),
      ],
      child: const App(),
    ),
  );
}
