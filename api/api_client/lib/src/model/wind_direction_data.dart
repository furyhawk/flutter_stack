//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/station.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/reading.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wind_direction_data.g.dart';

/// WindDirectionData
///
/// Properties:
/// * [stations] 
/// * [readings] 
/// * [readingType] 
/// * [readingUnit] 
/// * [paginationToken] 
@BuiltValue()
abstract class WindDirectionData implements Built<WindDirectionData, WindDirectionDataBuilder> {
  @BuiltValueField(wireName: r'stations')
  BuiltList<Station> get stations;

  @BuiltValueField(wireName: r'readings')
  BuiltList<Reading> get readings;

  @BuiltValueField(wireName: r'readingType')
  String get readingType;

  @BuiltValueField(wireName: r'readingUnit')
  String get readingUnit;

  @BuiltValueField(wireName: r'paginationToken')
  String? get paginationToken;

  WindDirectionData._();

  factory WindDirectionData([void updates(WindDirectionDataBuilder b)]) = _$WindDirectionData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WindDirectionDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WindDirectionData> get serializer => _$WindDirectionDataSerializer();
}

class _$WindDirectionDataSerializer implements PrimitiveSerializer<WindDirectionData> {
  @override
  final Iterable<Type> types = const [WindDirectionData, _$WindDirectionData];

  @override
  final String wireName = r'WindDirectionData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WindDirectionData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'stations';
    yield serializers.serialize(
      object.stations,
      specifiedType: const FullType(BuiltList, [FullType(Station)]),
    );
    yield r'readings';
    yield serializers.serialize(
      object.readings,
      specifiedType: const FullType(BuiltList, [FullType(Reading)]),
    );
    yield r'readingType';
    yield serializers.serialize(
      object.readingType,
      specifiedType: const FullType(String),
    );
    yield r'readingUnit';
    yield serializers.serialize(
      object.readingUnit,
      specifiedType: const FullType(String),
    );
    if (object.paginationToken != null) {
      yield r'paginationToken';
      yield serializers.serialize(
        object.paginationToken,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WindDirectionData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WindDirectionDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'stations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Station)]),
          ) as BuiltList<Station>;
          result.stations.replace(valueDes);
          break;
        case r'readings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Reading)]),
          ) as BuiltList<Reading>;
          result.readings.replace(valueDes);
          break;
        case r'readingType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.readingType = valueDes;
          break;
        case r'readingUnit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.readingUnit = valueDes;
          break;
        case r'paginationToken':
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
  WindDirectionData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WindDirectionDataBuilder();
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

