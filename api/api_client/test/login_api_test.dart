import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for LoginApi
void main() {
  final instance = ApiClient().getLoginApi();

  group(LoginApi, () {
    // Login Access Token
    //
    // OAuth2 compatible token login, get an access token for future requests
    //
    //Future<Token> loginLoginAccessToken(String username, String password, { String grantType, String scope, String clientId, String clientSecret }) async
    test('test loginLoginAccessToken', () async {
      // TODO
    });

    // Recover Password
    //
    // Password Recovery
    //
    //Future<Message> loginRecoverPassword(String email) async
    test('test loginRecoverPassword', () async {
      // TODO
    });

    // Recover Password Html Content
    //
    // HTML Content for Password Recovery
    //
    //Future<String> loginRecoverPasswordHtmlContent(String email) async
    test('test loginRecoverPasswordHtmlContent', () async {
      // TODO
    });

    // Reset Password
    //
    // Reset password
    //
    //Future<Message> loginResetPassword(NewPassword newPassword) async
    test('test loginResetPassword', () async {
      // TODO
    });

    // Test Token
    //
    // Test access token
    //
    //Future<UserPublic> loginTestToken() async
    test('test loginTestToken', () async {
      // TODO
    });

  });
}
