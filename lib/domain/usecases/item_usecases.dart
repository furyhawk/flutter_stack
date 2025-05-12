import 'package:api_client/api_client.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/item_repository.dart';

class GetItemsUseCase {
  final ItemRepository _repository;
  
  GetItemsUseCase(this._repository);
  
  Future<ApiResult<List<ItemPublic>>> execute() async {
    final result = await _repository.getItems();
    
    if (result.isSuccess && result.data != null) {
      // Convert from ItemsPublic to List<ItemPublic>
      return ApiResult.success(result.data!.toList());
    }
    
    return ApiResult.error(
      result.message ?? 'Failed to get items',
      statusCode: result.statusCode,
    );
  }
}

class CreateItemUseCase {
  final ItemRepository _repository;
  
  CreateItemUseCase(this._repository);
  
  Future<ApiResult<ItemPublic>> execute({
    required String title,
    String? description,
  }) async {
    // Create the item object
    final item = ItemCreate((b) => b
      ..title = title
      ..description = description
    );
    
    return _repository.createItem(item);
  }
}

class UpdateItemUseCase {
  final ItemRepository _repository;
  
  UpdateItemUseCase(this._repository);
  
  Future<ApiResult<ItemPublic>> execute({
    required String id,
    String? title,
    String? description,
  }) async {
    // Create the update item object
    final item = ItemUpdate((b) => b
      ..title = title
      ..description = description
    );
    
    return _repository.updateItem(id, item);
  }
}

class DeleteItemUseCase {
  final ItemRepository _repository;
  
  DeleteItemUseCase(this._repository);
  
  Future<ApiResult<void>> execute(String id) async {
    return _repository.deleteItem(id);
  }
}
