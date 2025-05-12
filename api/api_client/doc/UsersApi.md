# api_client.api.UsersApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersCreateUser**](UsersApi.md#userscreateuser) | **POST** /api/v1/users/ | Create User
[**usersDeleteUser**](UsersApi.md#usersdeleteuser) | **DELETE** /api/v1/users/{user_id} | Delete User
[**usersDeleteUserMe**](UsersApi.md#usersdeleteuserme) | **DELETE** /api/v1/users/me | Delete User Me
[**usersReadUserById**](UsersApi.md#usersreaduserbyid) | **GET** /api/v1/users/{user_id} | Read User By Id
[**usersReadUserMe**](UsersApi.md#usersreaduserme) | **GET** /api/v1/users/me | Read User Me
[**usersReadUsers**](UsersApi.md#usersreadusers) | **GET** /api/v1/users/ | Read Users
[**usersRegisterUser**](UsersApi.md#usersregisteruser) | **POST** /api/v1/users/signup | Register User
[**usersUpdatePasswordMe**](UsersApi.md#usersupdatepasswordme) | **PATCH** /api/v1/users/me/password | Update Password Me
[**usersUpdateUser**](UsersApi.md#usersupdateuser) | **PATCH** /api/v1/users/{user_id} | Update User
[**usersUpdateUserMe**](UsersApi.md#usersupdateuserme) | **PATCH** /api/v1/users/me | Update User Me


# **usersCreateUser**
> UserPublic usersCreateUser(userCreate)

Create User

Create new user.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final UserCreate userCreate = ; // UserCreate | 

try {
    final response = api.usersCreateUser(userCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersCreateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCreate** | [**UserCreate**](UserCreate.md)|  | 

### Return type

[**UserPublic**](UserPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersDeleteUser**
> Message usersDeleteUser(userId)

Delete User

Delete a user.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.usersDeleteUser(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersDeleteUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**Message**](Message.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersDeleteUserMe**
> Message usersDeleteUserMe()

Delete User Me

Delete own user.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();

try {
    final response = api.usersDeleteUserMe();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersDeleteUserMe: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Message**](Message.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersReadUserById**
> UserPublic usersReadUserById(userId)

Read User By Id

Get a specific user by id.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.usersReadUserById(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersReadUserById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**UserPublic**](UserPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersReadUserMe**
> UserPublic usersReadUserMe()

Read User Me

Get current user.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();

try {
    final response = api.usersReadUserMe();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersReadUserMe: $e\n');
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

# **usersReadUsers**
> UsersPublic usersReadUsers(skip, limit)

Read Users

Retrieve users.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.usersReadUsers(skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersReadUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 100]

### Return type

[**UsersPublic**](UsersPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersRegisterUser**
> UserPublic usersRegisterUser(userRegister)

Register User

Create new user without the need to be logged in.

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getUsersApi();
final UserRegister userRegister = ; // UserRegister | 

try {
    final response = api.usersRegisterUser(userRegister);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersRegisterUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userRegister** | [**UserRegister**](UserRegister.md)|  | 

### Return type

[**UserPublic**](UserPublic.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdatePasswordMe**
> Message usersUpdatePasswordMe(updatePassword)

Update Password Me

Update own password.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final UpdatePassword updatePassword = ; // UpdatePassword | 

try {
    final response = api.usersUpdatePasswordMe(updatePassword);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersUpdatePasswordMe: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updatePassword** | [**UpdatePassword**](UpdatePassword.md)|  | 

### Return type

[**Message**](Message.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdateUser**
> UserPublic usersUpdateUser(userId, userUpdate)

Update User

Update a user.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final UserUpdate userUpdate = ; // UserUpdate | 

try {
    final response = api.usersUpdateUser(userId, userUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersUpdateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **userUpdate** | [**UserUpdate**](UserUpdate.md)|  | 

### Return type

[**UserPublic**](UserPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdateUserMe**
> UserPublic usersUpdateUserMe(userUpdateMe)

Update User Me

Update own user.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getUsersApi();
final UserUpdateMe userUpdateMe = ; // UserUpdateMe | 

try {
    final response = api.usersUpdateUserMe(userUpdateMe);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->usersUpdateUserMe: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userUpdateMe** | [**UserUpdateMe**](UserUpdateMe.md)|  | 

### Return type

[**UserPublic**](UserPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

