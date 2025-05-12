# api_client.api.UtilsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**utilsHealthCheck**](UtilsApi.md#utilshealthcheck) | **GET** /api/v1/utils/health-check/ | Health Check
[**utilsTestEmail**](UtilsApi.md#utilstestemail) | **POST** /api/v1/utils/test-email/ | Test Email


# **utilsHealthCheck**
> bool utilsHealthCheck()

Health Check

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getUtilsApi();

try {
    final response = api.utilsHealthCheck();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UtilsApi->utilsHealthCheck: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **utilsTestEmail**
> Message utilsTestEmail(emailTo)

Test Email

Test emails.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUtilsApi();
final String emailTo = emailTo_example; // String | 

try {
    final response = api.utilsTestEmail(emailTo);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UtilsApi->utilsTestEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailTo** | **String**|  | 

### Return type

[**Message**](Message.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

