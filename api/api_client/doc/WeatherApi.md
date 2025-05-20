# api_client.api.WeatherApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**weatherGetTwoHourForecast**](WeatherApi.md#weathergettwohourforecast) | **GET** /api/v1/weather/two-hour-forecast | Get Two Hour Forecast


# **weatherGetTwoHourForecast**
> WeatherResponse weatherGetTwoHourForecast(date, paginationToken)

Get Two Hour Forecast

Retrieve the latest two hour weather forecast from data.gov.sg API.  - Updated half-hourly from NEA - Forecasts are given for multiple areas in Singapore

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getWeatherApi();
final String date = date_example; // String | SGT date for which to retrieve data (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)
final String paginationToken = paginationToken_example; // String | Pagination token for retrieving subsequent data pages

try {
    final response = api.weatherGetTwoHourForecast(date, paginationToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WeatherApi->weatherGetTwoHourForecast: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| SGT date for which to retrieve data (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS) | [optional] 
 **paginationToken** | **String**| Pagination token for retrieving subsequent data pages | [optional] 

### Return type

[**WeatherResponse**](WeatherResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

