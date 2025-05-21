import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stack/core/di/service_locator.dart';
import 'package:flutter_stack/domain/services/auth_service.dart';
import 'package:flutter_stack/domain/services/item_service.dart';
import 'package:flutter_stack/presentation/widgets/dialogs/item_dialog.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _itemService = ServiceLocator.instance.get<ItemService>();
  List<ItemPublic>? _items;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final result = await _itemService.getItems();

    setState(() {
      _isLoading = false;
      if (result.isSuccess) {
        _items = result.data;
      } else {
        _error = result.message ?? 'Failed to load items';
      }
    });
  }

  Future<void> _logout() async {
    await context.read<AuthService>().logout();
  }

  Future<void> _showAddItemDialog() async {
    final result = await ItemDialog.show(context: context);

    if (result != null) {
      await _addNewItem(
        title: result['title']!,
        description:
            result['description']!.isNotEmpty ? result['description'] : null,
      );
    }
  }

  Future<void> _addNewItem({required String title, String? description}) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final result = await _itemService.createItem(
      title: title,
      description: description,
    );

    setState(() {
      _isLoading = false;
    });

    if (result.isSuccess && result.data != null) {
      // Add the new item to the list and refresh the list
      await _loadItems();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item created successfully')),
      );
    } else {
      setState(() {
        _error = result.message ?? 'Failed to create item';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.message ?? 'Failed to create item'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final user = authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          if (user != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(child: Icon(Icons.person)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.fullName ?? 'User',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              user.email,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Expanded(child: _buildItemsList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildItemsList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _loadItems, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_items == null || _items!.isEmpty) {
      return const Center(child: Text('No items found'));
    }

    return RefreshIndicator(
      onRefresh: _loadItems,
      child: ListView.builder(
        itemCount: _items!.length,
        itemBuilder: (context, index) {
          final item = _items![index];
          return ListTile(
            title: Text(item.title),
            subtitle: item.description != null ? Text(item.description!) : null,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to item details (implementation would go here)
            },
          );
        },
      ),
    );
  }
}
