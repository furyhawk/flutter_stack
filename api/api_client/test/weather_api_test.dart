import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for WeatherApi
void main() {
  final instance = ApiClient().getWeatherApi();

  group(WeatherApi, () {
    // Get Two Hour Forecast
    //
    // Retrieve the latest two hour weather forecast from data.gov.sg API.  - Updated half-hourly from NEA - Forecasts are given for multiple areas in Singapore
    //
    //Future<WeatherResponse> weatherGetTwoHourForecast({ String date, String paginationToken }) async
    test('test weatherGetTwoHourForecast', () async {
      // TODO
    });

  });
}
