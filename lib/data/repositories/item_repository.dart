import 'package:api_client/api_client.dart';
import 'package:flutter_stack/core/network/api_client_provider.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/base_repository.dart';

class ItemRepository extends BaseRepository {
  ItemRepository(ApiClientProvider apiClientProvider) : super(apiClientProvider);
  
  /// Get all items
  Future<ApiResult<ItemsPublic>> getItems() async {
    return safeApiCall(() => apiClientProvider.itemsApi.readItems());
  }
  
  /// Get item by ID
  Future<ApiResult<ItemPublic>> getItem(String id) async {
    return safeApiCall(() => apiClientProvider.itemsApi.readItem(id));
  }
  
  /// Create item
  Future<ApiResult<ItemPublic>> createItem(ItemCreate item) async {
    return safeApiCall(() => apiClientProvider.itemsApi.createItem(itemCreate: item));
  }
  
  /// Update item
  Future<ApiResult<ItemPublic>> updateItem(String id, ItemUpdate item) async {
    return safeApiCall(() => apiClientProvider.itemsApi.updateItem(
      id: id, 
      itemUpdate: item,
    ));
  }
  
  /// Delete item
  Future<ApiResult<void>> deleteItem(String id) async {
    return safeApiCall(() => apiClientProvider.itemsApi.deleteItem(id));
  }
}
