import 'package:flutter/material.dart';

/// A dialog for adding or editing items
class ItemDialog extends StatefulWidget {
  /// The initial title value, used when editing an existing item
  final String? initialTitle;
  
  /// The initial description value, used when editing an existing item
  final String? initialDescription;
  
  /// Dialog title
  final String title;
  
  /// Create a new item dialog
  const ItemDialog({
    super.key,
    this.initialTitle,
    this.initialDescription,
    required this.title,
  });

  @override
  State<ItemDialog> createState() => _ItemDialogState();
  
  /// Shows an item dialog and returns the result
  static Future<Map<String, String>?> show({
    required BuildContext context,
    String title = 'Add New Item',
    String? initialTitle,
    String? initialDescription,
  }) {
    return showDialog<Map<String, String>>(
      context: context,
      builder: (context) => ItemDialog(
        title: title,
        initialTitle: initialTitle,
        initialDescription: initialDescription,
      ),
    );
  }
}

class _ItemDialogState extends State<ItemDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle ?? '');
    _descriptionController = TextEditingController(text: widget.initialDescription ?? '');
  }
  
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  
  void _validateAndSave() {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title is required')),
      );
      return;
    }
    
    Navigator.of(context).pop({
      'title': _titleController.text.trim(),
      'description': _descriptionController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _validateAndSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
