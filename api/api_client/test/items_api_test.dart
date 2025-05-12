import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for ItemsApi
void main() {
  final instance = ApiClient().getItemsApi();

  group(ItemsApi, () {
    // Create Item
    //
    // Create new item.
    //
    //Future<ItemPublic> itemsCreateItem(ItemCreate itemCreate) async
    test('test itemsCreateItem', () async {
      // TODO
    });

    // Delete Item
    //
    // Delete an item.
    //
    //Future<Message> itemsDeleteItem(String id) async
    test('test itemsDeleteItem', () async {
      // TODO
    });

    // Read Item
    //
    // Get item by ID.
    //
    //Future<ItemPublic> itemsReadItem(String id) async
    test('test itemsReadItem', () async {
      // TODO
    });

    // Read Items
    //
    // Retrieve items.
    //
    //Future<ItemsPublic> itemsReadItems({ int skip, int limit }) async
    test('test itemsReadItems', () async {
      // TODO
    });

    // Update Item
    //
    // Update an item.
    //
    //Future<ItemPublic> itemsUpdateItem(String id, ItemUpdate itemUpdate) async
    test('test itemsUpdateItem', () async {
      // TODO
    });

  });
}
