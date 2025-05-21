import 'package:api_client/api_client.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/domain/usecases/item_usecases.dart';

/// Service responsible for managing item operations
class ItemService {
  final CreateItemUseCase _createItemUseCase;
  final GetItemsUseCase _getItemsUseCase;
  final UpdateItemUseCase _updateItemUseCase;
  final DeleteItemUseCase _deleteItemUseCase;

  /// Creates an instance of [ItemService]
  ItemService({
    required CreateItemUseCase createItemUseCase,
    required GetItemsUseCase getItemsUseCase,
    required UpdateItemUseCase updateItemUseCase,
    required DeleteItemUseCase deleteItemUseCase,
  })  : _createItemUseCase = createItemUseCase,
        _getItemsUseCase = getItemsUseCase,
        _updateItemUseCase = updateItemUseCase,
        _deleteItemUseCase = deleteItemUseCase;

  /// Gets all items
  Future<ApiResult<List<ItemPublic>>> getItems() async {
    return _getItemsUseCase.execute();
  }

  /// Creates a new item
  Future<ApiResult<ItemPublic>> createItem({
    required String title,
    String? description,
  }) async {
    return _createItemUseCase.execute(
      title: title,
      description: description,
    );
  }

  /// Updates an existing item
  Future<ApiResult<ItemPublic>> updateItem({
    required String id,
    String? title,
    String? description,
  }) async {
    return _updateItemUseCase.execute(
      id: id,
      title: title,
      description: description,
    );
  }

  /// Deletes an item
  Future<ApiResult<void>> deleteItem(String id) async {
    return _deleteItemUseCase.execute(id);
  }
}
