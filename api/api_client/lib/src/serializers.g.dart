// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add(AirTemperatureData.serializer)
      ..add(AirTemperatureResponse.serializer)
      ..add(AreaMetadata.serializer)
      ..add(ForecastInfo.serializer)
      ..add(ForecastItem.serializer)
      ..add(ForecastPeriodGeneral.serializer)
      ..add(FourDayForecastData.serializer)
      ..add(FourDayForecastItem.serializer)
      ..add(FourDayForecastResponse.serializer)
      ..add(GeneralForecast.serializer)
      ..add(HTTPValidationError.serializer)
      ..add(HumidityRange.serializer)
      ..add(ItemCreate.serializer)
      ..add(ItemPublic.serializer)
      ..add(ItemUpdate.serializer)
      ..add(ItemsPublic.serializer)
      ..add(LabelLocation.serializer)
      ..add(LightningData.serializer)
      ..add(LightningRecord.serializer)
      ..add(LightningResponse.serializer)
      ..add(Message.serializer)
      ..add(NewPassword.serializer)
      ..add(PrivateUserCreate.serializer)
      ..add(Reading.serializer)
      ..add(ReadingDataPoint.serializer)
      ..add(Station.serializer)
      ..add(TemperatureRange.serializer)
      ..add(Token.serializer)
      ..add(TwentyFourHourForecastData.serializer)
      ..add(TwentyFourHourForecastResponse.serializer)
      ..add(UpdatePassword.serializer)
      ..add(UserCreate.serializer)
      ..add(UserPublic.serializer)
      ..add(UserRegister.serializer)
      ..add(UserUpdate.serializer)
      ..add(UserUpdateMe.serializer)
      ..add(UsersPublic.serializer)
      ..add(ValidationError.serializer)
      ..add(ValidationErrorLocInner.serializer)
      ..add(WBGTData.serializer)
      ..add(WBGTRecord.serializer)
      ..add(WBGTResponse.serializer)
      ..add(WeatherResponse.serializer)
      ..add(WindDirectionData.serializer)
      ..add(WindDirectionResponse.serializer)
      ..add(WindInfo.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AreaMetadata)]),
          () => ListBuilder<AreaMetadata>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ForecastItem)]),
          () => ListBuilder<ForecastItem>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(BuiltMap, const [
              const FullType(String),
              const FullType.nullable(JsonObject)
            ])
          ]),
          () => ListBuilder<BuiltMap<String, JsonObject?>>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(BuiltMap, const [
              const FullType(String),
              const FullType.nullable(JsonObject)
            ])
          ]),
          () => ListBuilder<BuiltMap<String, JsonObject?>>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(FourDayForecastItem)]),
          () => ListBuilder<FourDayForecastItem>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ItemPublic)]),
          () => ListBuilder<ItemPublic>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LightningRecord)]),
          () => ListBuilder<LightningRecord>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ReadingDataPoint)]),
          () => ListBuilder<ReadingDataPoint>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Station)]),
          () => ListBuilder<Station>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Reading)]),
          () => ListBuilder<Reading>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Station)]),
          () => ListBuilder<Station>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Reading)]),
          () => ListBuilder<Reading>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserPublic)]),
          () => ListBuilder<UserPublic>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ValidationError)]),
          () => ListBuilder<ValidationError>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ValidationErrorLocInner)]),
          () => ListBuilder<ValidationErrorLocInner>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(WBGTRecord)]),
          () => ListBuilder<WBGTRecord>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(num)]),
          () => MapBuilder<String, num>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType.nullable(JsonObject)
          ]),
          () => MapBuilder<String, JsonObject?>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType.nullable(JsonObject)
          ]),
          () => MapBuilder<String, JsonObject?>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType.nullable(JsonObject)
          ]),
          () => MapBuilder<String, JsonObject?>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType.nullable(JsonObject)
          ]),
          () => MapBuilder<String, JsonObject?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
