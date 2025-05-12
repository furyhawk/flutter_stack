# api_client.api.ItemsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**itemsCreateItem**](ItemsApi.md#itemscreateitem) | **POST** /api/v1/items/ | Create Item
[**itemsDeleteItem**](ItemsApi.md#itemsdeleteitem) | **DELETE** /api/v1/items/{id} | Delete Item
[**itemsReadItem**](ItemsApi.md#itemsreaditem) | **GET** /api/v1/items/{id} | Read Item
[**itemsReadItems**](ItemsApi.md#itemsreaditems) | **GET** /api/v1/items/ | Read Items
[**itemsUpdateItem**](ItemsApi.md#itemsupdateitem) | **PUT** /api/v1/items/{id} | Update Item


# **itemsCreateItem**
> ItemPublic itemsCreateItem(itemCreate)

Create Item

Create new item.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getItemsApi();
final ItemCreate itemCreate = ; // ItemCreate | 

try {
    final response = api.itemsCreateItem(itemCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemsApi->itemsCreateItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemCreate** | [**ItemCreate**](ItemCreate.md)|  | 

### Return type

[**ItemPublic**](ItemPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **itemsDeleteItem**
> Message itemsDeleteItem(id)

Delete Item

Delete an item.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getItemsApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.itemsDeleteItem(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemsApi->itemsDeleteItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Message**](Message.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **itemsReadItem**
> ItemPublic itemsReadItem(id)

Read Item

Get item by ID.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getItemsApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.itemsReadItem(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemsApi->itemsReadItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**ItemPublic**](ItemPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **itemsReadItems**
> ItemsPublic itemsReadItems(skip, limit)

Read Items

Retrieve items.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getItemsApi();
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.itemsReadItems(skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemsApi->itemsReadItems: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 100]

### Return type

[**ItemsPublic**](ItemsPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **itemsUpdateItem**
> ItemPublic itemsUpdateItem(id, itemUpdate)

Update Item

Update an item.

### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiClient().getItemsApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ItemUpdate itemUpdate = ; // ItemUpdate | 

try {
    final response = api.itemsUpdateItem(id, itemUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemsApi->itemsUpdateItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **itemUpdate** | [**ItemUpdate**](ItemUpdate.md)|  | 

### Return type

[**ItemPublic**](ItemPublic.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

