import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for PrivateApi
void main() {
  final instance = ApiClient().getPrivateApi();

  group(PrivateApi, () {
    // Create User
    //
    // Create a new user.
    //
    //Future<UserPublic> privateCreateUser(PrivateUserCreate privateUserCreate) async
    test('test privateCreateUser', () async {
      // TODO
    });

  });
}
