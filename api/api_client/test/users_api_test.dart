import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for UsersApi
void main() {
  final instance = ApiClient().getUsersApi();

  group(UsersApi, () {
    // Create User
    //
    // Create new user.
    //
    //Future<UserPublic> usersCreateUser(UserCreate userCreate) async
    test('test usersCreateUser', () async {
      // TODO
    });

    // Delete User
    //
    // Delete a user.
    //
    //Future<Message> usersDeleteUser(String userId) async
    test('test usersDeleteUser', () async {
      // TODO
    });

    // Delete User Me
    //
    // Delete own user.
    //
    //Future<Message> usersDeleteUserMe() async
    test('test usersDeleteUserMe', () async {
      // TODO
    });

    // Read User By Id
    //
    // Get a specific user by id.
    //
    //Future<UserPublic> usersReadUserById(String userId) async
    test('test usersReadUserById', () async {
      // TODO
    });

    // Read User Me
    //
    // Get current user.
    //
    //Future<UserPublic> usersReadUserMe() async
    test('test usersReadUserMe', () async {
      // TODO
    });

    // Read Users
    //
    // Retrieve users.
    //
    //Future<UsersPublic> usersReadUsers({ int skip, int limit }) async
    test('test usersReadUsers', () async {
      // TODO
    });

    // Register User
    //
    // Create new user without the need to be logged in.
    //
    //Future<UserPublic> usersRegisterUser(UserRegister userRegister) async
    test('test usersRegisterUser', () async {
      // TODO
    });

    // Update Password Me
    //
    // Update own password.
    //
    //Future<Message> usersUpdatePasswordMe(UpdatePassword updatePassword) async
    test('test usersUpdatePasswordMe', () async {
      // TODO
    });

    // Update User
    //
    // Update a user.
    //
    //Future<UserPublic> usersUpdateUser(String userId, UserUpdate userUpdate) async
    test('test usersUpdateUser', () async {
      // TODO
    });

    // Update User Me
    //
    // Update own user.
    //
    //Future<UserPublic> usersUpdateUserMe(UserUpdateMe userUpdateMe) async
    test('test usersUpdateUserMe', () async {
      // TODO
    });

  });
}
