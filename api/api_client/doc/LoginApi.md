# api_client.api.LoginApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**loginLoginAccessToken**](LoginApi.md#loginloginaccesstoken) | **POST** /api/v1/login/access-token | Login Access Token
[**loginRecoverPassword**](LoginApi.md#loginrecoverpassword) | **POST** /api/v1/password-recovery/{email} | Recover Password
[**loginRecoverPasswordHtmlContent**](LoginApi.md#loginrecoverpasswordhtmlcontent) | **POST** /api/v1/password-recovery-html-content/{email} | Recover Password Html Content
[**loginResetPassword**](LoginApi.md#loginresetpassword) | **POST** /api/v1/reset-password/ | Reset Password
[**loginTestToken**](LoginApi.md#logintesttoken) | **POST** /api/v1/login/test-token | Test Token


# **loginLoginAccessToken**
> Token loginLoginAccessToken(username, password, grantType, scope, clientId, clientSecret)

Login Access Token

OAuth2 compatible token login, get an access token for future requests

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getLoginApi();
final String username = username_example; // String | 
final String password = password_example; // String | 
final String grantType = grantType_example; // String | 
final String scope = scope_example; // String | 
final String clientId = clientId_example; // String | 
final String clientSecret = clientSecret_example; // String | 

try {
    final response = api.loginLoginAccessToken(username, password, grantType, scope, clientId, clientSecret);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LoginApi->loginLoginAccessToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | 
 **password** | **String**|  | 
 **grantType** | **String**|  | [optional] 
 **scope** | **String**|  | [optional] [default to '']
 **clientId** | **String**|  | [optional] 
 **clientSecret** | **String**|  | [optional] 

### Return type

[**Token**](Token.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginRecoverPassword**
> Message loginRecoverPassword(email)

Recover Password

Password Recovery

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getLoginApi();
final String email = email_example; // String | 

try {
    final response = api.loginRecoverPassword(email);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LoginApi->loginRecoverPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

[**Message**](Message.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginRecoverPasswordHtmlContent**
> String loginRecoverPasswordHtmlContent(email)

Recover Password Html Content

HTML Content for Password Recovery

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getLoginApi();
final String email = email_example; // String | 

try {
    final response = api.loginRecoverPasswordHtmlContent(email);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LoginApi->loginRecoverPasswordHtmlContent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

**String**

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/html, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginResetPassword**
> Message loginResetPassword(newPassword)

Reset Password

Reset password

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getLoginApi();
final NewPassword newPassword = ; // NewPassword | 

try {
    final response = api.loginResetPassword(newPassword);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LoginApi->loginResetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newPassword** | [**NewPassword**](NewPassword.md)|  | 

### Return type

[**Message**](Message.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginTestToken**
> UserPublic loginTestToken()

Test Token

Test access token

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getLoginApi();

try {
    final response = api.loginTestToken();
    print(response);
} catch on DioException (e) {
    print('Exception when calling LoginApi->loginTestToken: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserPublic**](UserPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

