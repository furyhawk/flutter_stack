import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stack/core/api/api_service.dart';

/// Repository for item operations
class ItemsRepository {
  final ApiService _apiService;
  
  ItemsRepository(this._apiService);
  
  /// Get all items
  Future<ItemsPublic> getAllItems({int skip = 0, int limit = 10}) async {
    try {
      final response = await _apiService.itemsApi.itemsGet(
        skip: skip,
        limit: limit,
      );
      
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch items: ${e.toString()}');
    }
  }
  
  /// Get a specific item by ID
  Future<ItemPublic> getItem(String itemId) async {
    try {
      final response = await _apiService.itemsApi.itemsItemIdGet(
        itemId: itemId,
      );
      
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch item: ${e.toString()}');
    }
  }
  
  /// Create a new item
  Future<ItemPublic> createItem({
    required String title,
    required String description,
  }) async {
    try {
      final itemCreate = ItemCreate((b) => b
        ..title = title
        ..description = description);
      
      final response = await _apiService.itemsApi.itemsPost(
        itemCreate: itemCreate,
      );
      
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to create item: ${e.toString()}');
    }
  }
  
  /// Update an existing item
  Future<ItemPublic> updateItem({
    required String itemId,
    required String title,
    required String description,
  }) async {
    try {
      final itemUpdate = ItemUpdate((b) => b
        ..title = title
        ..description = description);
      
      final response = await _apiService.itemsApi.itemsItemIdPut(
        itemId: itemId,
        itemUpdate: itemUpdate,
      );
      
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to update item: ${e.toString()}');
    }
  }
  
  /// Delete an item
  Future<void> deleteItem(String itemId) async {
    try {
      await _apiService.itemsApi.itemsItemIdDelete(
        itemId: itemId,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to delete item: ${e.toString()}');
    }
  }
  
  /// Handle Dio errors and return appropriate exceptions
  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return Exception('Authentication required: Please log in');
      } else if (e.response!.statusCode == 403) {
        return Exception('Access denied: You don\'t have permission for this action');
      } else if (e.response!.statusCode == 404) {
        return Exception('Not found: The requested item does not exist');
      } else if (e.response!.statusCode == 400) {
        return Exception('Bad request: Please check your inputs');
      } else if (e.response!.statusCode == 500) {
        return Exception('Server error: Please try again later');
      }
    }
    return Exception('Network error: ${e.message}');
  }
}
