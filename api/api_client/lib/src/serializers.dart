//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:api_client/src/date_serializer.dart';
import 'package:api_client/src/model/date.dart';

import 'package:api_client/src/model/air_temperature_data.dart';
import 'package:api_client/src/model/air_temperature_response.dart';
import 'package:api_client/src/model/area_metadata.dart';
import 'package:api_client/src/model/forecast_info.dart';
import 'package:api_client/src/model/forecast_item.dart';
import 'package:api_client/src/model/forecast_period_general.dart';
import 'package:api_client/src/model/four_day_forecast_data.dart';
import 'package:api_client/src/model/four_day_forecast_item.dart';
import 'package:api_client/src/model/four_day_forecast_response.dart';
import 'package:api_client/src/model/general_forecast.dart';
import 'package:api_client/src/model/http_validation_error.dart';
import 'package:api_client/src/model/humidity_range.dart';
import 'package:api_client/src/model/item_create.dart';
import 'package:api_client/src/model/item_public.dart';
import 'package:api_client/src/model/item_update.dart';
import 'package:api_client/src/model/items_public.dart';
import 'package:api_client/src/model/label_location.dart';
import 'package:api_client/src/model/lightning_data.dart';
import 'package:api_client/src/model/lightning_record.dart';
import 'package:api_client/src/model/lightning_response.dart';
import 'package:api_client/src/model/message.dart';
import 'package:api_client/src/model/new_password.dart';
import 'package:api_client/src/model/private_user_create.dart';
import 'package:api_client/src/model/reading.dart';
import 'package:api_client/src/model/reading_data_point.dart';
import 'package:api_client/src/model/station.dart';
import 'package:api_client/src/model/temperature_range.dart';
import 'package:api_client/src/model/token.dart';
import 'package:api_client/src/model/twenty_four_hour_forecast_data.dart';
import 'package:api_client/src/model/twenty_four_hour_forecast_response.dart';
import 'package:api_client/src/model/update_password.dart';
import 'package:api_client/src/model/user_create.dart';
import 'package:api_client/src/model/user_public.dart';
import 'package:api_client/src/model/user_register.dart';
import 'package:api_client/src/model/user_update.dart';
import 'package:api_client/src/model/user_update_me.dart';
import 'package:api_client/src/model/users_public.dart';
import 'package:api_client/src/model/validation_error.dart';
import 'package:api_client/src/model/validation_error_loc_inner.dart';
import 'package:api_client/src/model/wbgt_data.dart';
import 'package:api_client/src/model/wbgt_record.dart';
import 'package:api_client/src/model/wbgt_response.dart';
import 'package:api_client/src/model/weather_response.dart';
import 'package:api_client/src/model/wind_direction_data.dart';
import 'package:api_client/src/model/wind_direction_response.dart';
import 'package:api_client/src/model/wind_info.dart';

part 'serializers.g.dart';

@SerializersFor([
  AirTemperatureData,
  AirTemperatureResponse,
  AreaMetadata,
  ForecastInfo,
  ForecastItem,
  ForecastPeriodGeneral,
  FourDayForecastData,
  FourDayForecastItem,
  FourDayForecastResponse,
  GeneralForecast,
  HTTPValidationError,
  HumidityRange,
  ItemCreate,
  ItemPublic,
  ItemUpdate,
  ItemsPublic,
  LabelLocation,
  LightningData,
  LightningRecord,
  LightningResponse,
  Message,
  NewPassword,
  PrivateUserCreate,
  Reading,
  ReadingDataPoint,
  Station,
  TemperatureRange,
  Token,
  TwentyFourHourForecastData,
  TwentyFourHourForecastResponse,
  UpdatePassword,
  UserCreate,
  UserPublic,
  UserRegister,
  UserUpdate,
  UserUpdateMe,
  UsersPublic,
  ValidationError,
  ValidationErrorLocInner,
  WBGTData,
  WBGTRecord,
  WBGTResponse,
  WeatherResponse,
  WindDirectionData,
  WindDirectionResponse,
  WindInfo,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
        () => MapBuilder<String, JsonObject>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer())
    ).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
