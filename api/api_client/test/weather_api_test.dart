import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for WeatherApi
void main() {
  final instance = ApiClient().getWeatherApi();

  group(WeatherApi, () {
    // Get Air Temperature
    //
    // Get air temperature readings across Singapore  - Has per-minute readings from NEA - Unit of measure for readings is °C
    //
    //Future<AirTemperatureResponse> weatherGetAirTemperature({ String date, String paginationToken }) async
    test('test weatherGetAirTemperature', () async {
      // TODO
    });

    // Get Four Day Outlook
    //
    // Retrieve the latest 4 day weather forecast  - Updated twice a day from NEA - The forecast is for the next 4 days
    //
    //Future<FourDayForecastResponse> weatherGetFourDayOutlook({ String date, String paginationToken }) async
    test('test weatherGetFourDayOutlook', () async {
      // TODO
    });

    // Get Lightning
    //
    // Retrieve the latest lightning observation  - Updated multiple times throughout the day
    //
    //Future<LightningResponse> weatherGetLightning({ String date, String paginationToken }) async
    test('test weatherGetLightning', () async {
      // TODO
    });

    // Get Twenty Four Hour Forecast
    //
    // Retrieve the latest 24 hour weather forecast  - Updated multiple times throughout the day - Provides forecasts for different areas of Singapore
    //
    //Future<TwentyFourHourForecastResponse> weatherGetTwentyFourHourForecast({ String date, String paginationToken }) async
    test('test weatherGetTwentyFourHourForecast', () async {
      // TODO
    });

    // Get Two Hour Forecast
    //
    // Retrieve the latest two hour weather forecast from data.gov.sg API.  - Updated half-hourly from NEA - Forecasts are given for multiple areas in Singapore
    //
    //Future<WeatherResponse> weatherGetTwoHourForecast({ String date, String paginationToken }) async
    test('test weatherGetTwoHourForecast', () async {
      // TODO
    });

    // Get Wbgt
    //
    // Retrieve the latest WBGT (Wet Bulb Globe Temperature) data for accurate heat stress assessment  - Updated multiple times throughout the day - Unit of measure for readings is °C
    //
    //Future<WBGTResponse> weatherGetWbgt({ String date, String paginationToken }) async
    test('test weatherGetWbgt', () async {
      // TODO
    });

    // Get Wind Direction
    //
    // Get wind direction readings across Singapore  - Has per-minute readings from NEA - Unit of measure for readings is °
    //
    //Future<WindDirectionResponse> weatherGetWindDirection({ String date, String paginationToken }) async
    test('test weatherGetWindDirection', () async {
      // TODO
    });

  });
}
