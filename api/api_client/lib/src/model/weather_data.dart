//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/weather_item.dart';
import 'package:api_client/src/model/area_metadata.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather_data.g.dart';

/// WeatherData
///
/// Properties:
/// * [areaMetadata] 
/// * [items] 
/// * [paginationToken] 
@BuiltValue()
abstract class WeatherData implements Built<WeatherData, WeatherDataBuilder> {
  @BuiltValueField(wireName: r'area_metadata')
  BuiltList<AreaMetadata> get areaMetadata;

  @BuiltValueField(wireName: r'items')
  BuiltList<WeatherItem> get items;

  @BuiltValueField(wireName: r'pagination_token')
  String? get paginationToken;

  WeatherData._();

  factory WeatherData([void updates(WeatherDataBuilder b)]) = _$WeatherData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WeatherDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherData> get serializer => _$WeatherDataSerializer();
}

class _$WeatherDataSerializer implements PrimitiveSerializer<WeatherData> {
  @override
  final Iterable<Type> types = const [WeatherData, _$WeatherData];

  @override
  final String wireName = r'WeatherData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WeatherData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'area_metadata';
    yield serializers.serialize(
      object.areaMetadata,
      specifiedType: const FullType(BuiltList, [FullType(AreaMetadata)]),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(WeatherItem)]),
    );
    if (object.paginationToken != null) {
      yield r'pagination_token';
      yield serializers.serialize(
        object.paginationToken,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WeatherData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WeatherDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'area_metadata':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AreaMetadata)]),
          ) as BuiltList<AreaMetadata>;
          result.areaMetadata.replace(valueDes);
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(WeatherItem)]),
          ) as BuiltList<WeatherItem>;
          result.items.replace(valueDes);
          break;
        case r'pagination_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paginationToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WeatherData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherDataBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

