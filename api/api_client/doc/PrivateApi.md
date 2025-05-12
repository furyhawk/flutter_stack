# api_client.api.PrivateApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**privateCreateUser**](PrivateApi.md#privatecreateuser) | **POST** /api/v1/private/users/ | Create User


# **privateCreateUser**
> UserPublic privateCreateUser(privateUserCreate)

Create User

Create a new user.

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getPrivateApi();
final PrivateUserCreate privateUserCreate = ; // PrivateUserCreate | 

try {
    final response = api.privateCreateUser(privateUserCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PrivateApi->privateCreateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **privateUserCreate** | [**PrivateUserCreate**](PrivateUserCreate.md)|  | 

### Return type

[**UserPublic**](UserPublic.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

