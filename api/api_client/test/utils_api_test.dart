import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for UtilsApi
void main() {
  final instance = ApiClient().getUtilsApi();

  group(UtilsApi, () {
    // Health Check
    //
    //Future<bool> utilsHealthCheck() async
    test('test utilsHealthCheck', () async {
      // TODO
    });

    // Test Email
    //
    // Test emails.
    //
    //Future<Message> utilsTestEmail(String emailTo) async
    test('test utilsTestEmail', () async {
      // TODO
    });

  });
}
