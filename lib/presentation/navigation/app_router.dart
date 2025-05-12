import 'package:flutter/material.dart';
import 'package:flutter_stack/domain/services/auth_service.dart';
import 'package:flutter_stack/presentation/screens/auth/login_screen.dart';
import 'package:flutter_stack/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class AuthGuard extends StatefulWidget {
  final Widget child;

  const AuthGuard({Key? key, required this.child}) : super(key: key);

  @override
  State<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends State<AuthGuard> {
  @override
  void initState() {
    super.initState();
    // Initialize auth status
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthService>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        switch (authService.status) {
          case AuthStatus.unknown:
            return const SplashScreen();
          case AuthStatus.authenticated:
            return widget.child;
          case AuthStatus.unauthenticated:
            return const LoginScreen();
        }
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
