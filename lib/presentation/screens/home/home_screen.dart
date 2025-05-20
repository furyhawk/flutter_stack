import 'package:flutter/material.dart';
import 'package:flutter_stack/domain/services/auth_service.dart';
import 'package:flutter_stack/domain/services/item_service.dart';
import 'package:flutter_stack/domain/services/weather_service.dart'; // Ensure this is imported
import 'package:flutter_stack/presentation/screens/items/item_list_screen.dart';
import 'package:flutter_stack/presentation/screens/login/login_screen.dart';
import 'package:flutter_stack/presentation/screens/weather/weather_screen.dart'; // Ensure this is imported
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ItemListScreen(),
    const WeatherScreen(), // Added WeatherScreen
    // Add other screens here if needed
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stack'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
              // Guideline: Don't use BuildContexts across async gaps.
              // Check if the widget is still in the tree (mounted) before using context.
              if (mounted) {
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              }
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Weather', // Added Weather tab
          ),
          // Add other navigation items here
        ],
      ),
      floatingActionButton: _currentIndex == 0 // Show FAB only on ItemListScreen
          ? FloatingActionButton(
              onPressed: () {
                // Access ItemService and navigate to create item screen
                final itemService = Provider.of<ItemService>(context, listen: false);
                // Example: itemService.navigateToCreateItem(context);
                // This depends on how your navigation to create item is set up
                // For now, let's print a message or show a dialog
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Create new item tapped!')),
                  );
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

// Removed _fetchWeatherData and _fetchWeatherForCurrentLocation as they belong to WeatherScreen
