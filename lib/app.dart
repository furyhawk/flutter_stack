import 'package:flutter/material.dart';
import 'package:flutter_stack/core/theme/app_theme.dart';
import 'package:flutter_stack/features/auth/domain/auth_provider.dart';
import 'package:flutter_stack/features/auth/presentation/login_screen.dart';
import 'package:flutter_stack/features/home/presentation/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.system);

  @override
  void initState() {
    super.initState();
    // Check authentication status
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthProvider>().checkAuthentication();
    });
  }

  @override
  void dispose() {
    _themeMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, themeMode, child) {
        return MaterialApp(
          title: 'Flutter Stack',
          themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              if (authProvider.isLoading) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              
              return authProvider.isAuthenticated
                  ? const HomeScreen()
                  : const LoginScreen();
            },
          ),
        );
      },
    );
  }
}
