import 'package:api_client/api_client.dart'; // Added for WeatherResponse
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/base_repository.dart';

class WeatherRepository extends BaseRepository {
  WeatherRepository(super.apiClientProvider);

  /// Get Singapore Two Hour Forecast
  /// Retrieves the latest two-hour weather forecast from data.gov.sg API.
  Future<ApiResult<WeatherResponse>> getSgTwoHourForecast({
    String? date,
    String? paginationToken,
  }) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.weatherApi.weatherGetTwoHourForecast(
        date: date,
        paginationToken: paginationToken,
      );
      if (response.data == null) {
        throw Exception('No data returned from weatherGetTwoHourForecast');
      }
      return response.data!;
    });
  }
}
