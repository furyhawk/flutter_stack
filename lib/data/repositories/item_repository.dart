import 'package:api_client/api_client.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/base_repository.dart';

class ItemRepository extends BaseRepository {
  ItemRepository(super.apiClientProvider);
  
  /// Get all items
  Future<ApiResult<ItemsPublic>> getItems() async {
    return safeApiCall(() async {
      final response = await apiClientProvider.itemsApi.itemsReadItems();
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Get item by ID
  Future<ApiResult<ItemPublic>> getItem(String id) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.itemsApi.itemsReadItem(id: id);
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Create item
  Future<ApiResult<ItemPublic>> createItem(ItemCreate item) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.itemsApi.itemsCreateItem(itemCreate: item);
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Update item
  Future<ApiResult<ItemPublic>> updateItem(String id, ItemUpdate item) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.itemsApi.itemsUpdateItem(
        id: id, 
        itemUpdate: item,
      );
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Delete item
  Future<ApiResult<Message>> deleteItem(String id) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.itemsApi.itemsDeleteItem(id: id);
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
}
