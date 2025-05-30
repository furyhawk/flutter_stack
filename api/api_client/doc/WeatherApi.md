# api_client.api.WeatherApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**weatherGetAirTemperature**](WeatherApi.md#weathergetairtemperature) | **GET** /api/v1/weather/air-temperature | Get Air Temperature
[**weatherGetFourDayOutlook**](WeatherApi.md#weathergetfourdayoutlook) | **GET** /api/v1/weather/four-day-outlook | Get Four Day Outlook
[**weatherGetLightning**](WeatherApi.md#weathergetlightning) | **GET** /api/v1/weather/lightning | Get Lightning
[**weatherGetTwentyFourHourForecast**](WeatherApi.md#weathergettwentyfourhourforecast) | **GET** /api/v1/weather/twenty-four-hour-forecast | Get Twenty Four Hour Forecast
[**weatherGetTwoHourForecast**](WeatherApi.md#weathergettwohourforecast) | **GET** /api/v1/weather/two-hour-forecast | Get Two Hour Forecast
[**weatherGetWbgt**](WeatherApi.md#weathergetwbgt) | **GET** /api/v1/weather/wbgt | Get Wbgt
[**weatherGetWindDirection**](WeatherApi.md#weathergetwinddirection) | **GET** /api/v1/weather/wind-direction | Get Wind Direction


# **weatherGetAirTemperature**
> AirTemperatureResponse weatherGetAirTemperature(date, paginationToken)

Get Air Temperature

Get air temperature readings across Singapore  - Has per-minute readings from NEA - Unit of measure for readings is °C

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getWeatherApi();
final String date = date_example; // String | Format: YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS (SGT). Example: 2024-07-16 or 2024-07-16T23:59:00
final String paginationToken = paginationToken_example; // String | Pagination token for retrieving subsequent data pages

try {
    final response = api.weatherGetAirTemperature(date, paginationToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WeatherApi->weatherGetAirTemperature: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| Format: YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS (SGT). Example: 2024-07-16 or 2024-07-16T23:59:00 | [optional] 
 **paginationToken** | **String**| Pagination token for retrieving subsequent data pages | [optional] 

### Return type

[**AirTemperatureResponse**](AirTemperatureResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **weatherGetFourDayOutlook**
> FourDayForecastResponse weatherGetFourDayOutlook(date, paginationToken)

Get Four Day Outlook

Retrieve the latest 4 day weather forecast  - Updated twice a day from NEA - The forecast is for the next 4 days

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getWeatherApi();
final String date = date_example; // String | SGT date for which to retrieve data (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)
final String paginationToken = paginationToken_example; // String | Pagination token for retrieving subsequent data pages

try {
    final response = api.weatherGetFourDayOutlook(date, paginationToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WeatherApi->weatherGetFourDayOutlook: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| SGT date for which to retrieve data (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS) | [optional] 
 **paginationToken** | **String**| Pagination token for retrieving subsequent data pages | [optional] 

### Return type

[**FourDayForecastResponse**](FourDayForecastResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **weatherGetLightning**
> LightningResponse weatherGetLightning(date, paginationToken)

Get Lightning

Retrieve the latest lightning observation  - Updated multiple times throughout the day

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getWeatherApi();
final String date = date_example; // String | SGT date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS). Example: 2025-01-16 or 2025-01-16T23:59:00
final String paginationToken = paginationToken_example; // String | Pagination token for retrieving subsequent data pages

try {
    final response = api.weatherGetLightning(date, paginationToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WeatherApi->weatherGetLightning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| SGT date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS). Example: 2025-01-16 or 2025-01-16T23:59:00 | [optional] 
 **paginationToken** | **String**| Pagination token for retrieving subsequent data pages | [optional] 

### Return type

[**LightningResponse**](LightningResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **weatherGetTwentyFourHourForecast**
> TwentyFourHourForecastResponse weatherGetTwentyFourHourForecast(date, paginationToken)

Get Twenty Four Hour Forecast

Retrieve the latest 24 hour weather forecast  - Updated multiple times throughout the day - Provides forecasts for different areas of Singapore

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getWeatherApi();
final String date = date_example; // String | SGT date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS). Example: 2024-07-16 or 2024-07-16T23:59:00
final String paginationToken = paginationToken_example; // String | Pagination token for retrieving subsequent data pages

try {
    final response = api.weatherGetTwentyFourHourForecast(date, paginationToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WeatherApi->weatherGetTwentyFourHourForecast: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| SGT date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS). Example: 2024-07-16 or 2024-07-16T23:59:00 | [optional] 
 **paginationToken** | **String**| Pagination token for retrieving subsequent data pages | [optional] 

### Return type

[**TwentyFourHourForecastResponse**](TwentyFourHourForecastResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **weatherGetWbgt**
> WBGTResponse weatherGetWbgt(date, paginationToken)

Get Wbgt

Retrieve the latest WBGT (Wet Bulb Globe Temperature) data for accurate heat stress assessment  - Updated multiple times throughout the day - Unit of measure for readings is °C

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getWeatherApi();
final String date = date_example; // String | SGT date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS). Example: 2025-01-16 or 2025-01-16T23:59:00
final String paginationToken = paginationToken_example; // String | Pagination token for retrieving subsequent data pages

try {
    final response = api.weatherGetWbgt(date, paginationToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WeatherApi->weatherGetWbgt: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| SGT date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS). Example: 2025-01-16 or 2025-01-16T23:59:00 | [optional] 
 **paginationToken** | **String**| Pagination token for retrieving subsequent data pages | [optional] 

### Return type

[**WBGTResponse**](WBGTResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **weatherGetWindDirection**
> WindDirectionResponse weatherGetWindDirection(date, paginationToken)

Get Wind Direction

Get wind direction readings across Singapore  - Has per-minute readings from NEA - Unit of measure for readings is °

### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getWeatherApi();
final String date = date_example; // String | SGT date for which to retrieve data (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)
final String paginationToken = paginationToken_example; // String | Pagination token for retrieving subsequent data pages

try {
    final response = api.weatherGetWindDirection(date, paginationToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WeatherApi->weatherGetWindDirection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| SGT date for which to retrieve data (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS) | [optional] 
 **paginationToken** | **String**| Pagination token for retrieving subsequent data pages | [optional] 

### Return type

[**WindDirectionResponse**](WindDirectionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

