import 'package:api_client/api_client.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository _repository;
  
  LoginUseCase(this._repository);
  
  Future<ApiResult<Token>> execute({
    required String username,
    required String password,
  }) async {
    return _repository.login(username, password);
  }
}

class RegisterUseCase {
  final UserRepository _repository;
  
  RegisterUseCase(this._repository);
  
  Future<ApiResult<UserPublic>> execute({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final userRegister = UserRegister((b) => b
      ..email = email
      ..password = password
      ..firstName = firstName
      ..lastName = lastName
    );
    
    return _repository.register(userRegister);
  }
}

class GetCurrentUserUseCase {
  final UserRepository _repository;
  
  GetCurrentUserUseCase(this._repository);
  
  Future<ApiResult<UserPublic>> execute() async {
    return _repository.getCurrentUser();
  }
}

class UpdateUserProfileUseCase {
  final UserRepository _repository;
  
  UpdateUserProfileUseCase(this._repository);
  
  Future<ApiResult<UserPublic>> execute({
    String? firstName,
    String? lastName,
  }) async {
    final userUpdateMe = UserUpdateMe((b) => b
      ..firstName = firstName
      ..lastName = lastName
    );
    
    return _repository.updateCurrentUser(userUpdateMe);
  }
}
