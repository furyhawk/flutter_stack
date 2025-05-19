import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stack/core/utils/service_locator.dart';
import 'package:flutter_stack/features/items/data/items_repository.dart';
import 'package:flutter_stack/features/profile/presentation/profile_screen.dart';
import 'package:flutter_stack/features/weather/presentation/weather_screen.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final ItemsRepository _itemsRepository = ServiceLocator.itemsRepository;
  
  bool _isLoading = false;
  String? _errorMessage;
  ItemsPublic? _items;
  
  int _page = 0;
  static const int _pageSize = 10;
  
  @override
  void initState() {
    super.initState();
    _loadItems();
  }
  
  Future<void> _loadItems({bool refresh = false}) async {
    if (refresh) {
      setState(() {
        _page = 0;
      });
    }
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      final items = await _itemsRepository.getAllItems(
        skip: _page * _pageSize,
        limit: _pageSize,
      );
      
      setState(() {
        _items = items;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const WeatherScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: _isLoading && _items == null
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null && _items == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: $_errorMessage',
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _loadItems(refresh: true),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () => _loadItems(refresh: true),
                  child: _items == null || _items!.data.isEmpty
                      ? const Center(child: Text('No items found'))
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: _items?.data.length ?? 0,
                          itemBuilder: (context, index) {
                            final item = _items!.data[index];
                            return ItemCard(
                              item: item,
                              onDeleted: () => _loadItems(refresh: true),
                            );
                          },
                        ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  
  void _showAddItemDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (titleController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Title cannot be empty')),
                );
                return;
              }
              
              Navigator.of(context).pop();
              
              try {
                await _itemsRepository.createItem(
                  title: titleController.text,
                  description: descriptionController.text,
                );
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Item created successfully')),
                  );
                  _loadItems(refresh: true);
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${e.toString()}')),
                  );
                }
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final ItemPublic item;
  final VoidCallback onDeleted;
  
  const ItemCard({
    super.key,
    required this.item,
    required this.onDeleted,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final ItemsRepository _itemsRepository = ServiceLocator.itemsRepository;
  bool _isDeleting = false;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.item.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: _showEditDialog,
                    ),
                    IconButton(
                      icon: _isDeleting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.delete),
                      onPressed: _isDeleting ? null : _deleteItem,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.item.description ?? 'No description',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Owner ID: ${widget.item.ownerId}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
  
  Future<void> _deleteItem() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Item'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    
    if (confirmed != true) return;
    
    setState(() {
      _isDeleting = true;
    });
    
    try {
      await _itemsRepository.deleteItem(widget.item.id);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item deleted successfully')),
        );
        widget.onDeleted();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isDeleting = false;
        });
      }
    }
  }
  
  void _showEditDialog() {
    final titleController = TextEditingController(text: widget.item.title);
    final descriptionController = TextEditingController(text: widget.item.description);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (titleController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Title cannot be empty')),
                );
                return;
              }
              
              Navigator.of(context).pop();
              
              try {
                await _itemsRepository.updateItem(
                  itemId: widget.item.id,
                  title: titleController.text,
                  description: descriptionController.text,
                );
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Item updated successfully')),
                  );
                  widget.onDeleted();
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${e.toString()}')),
                  );
                }
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
