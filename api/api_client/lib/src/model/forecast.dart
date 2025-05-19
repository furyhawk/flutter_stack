//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forecast.g.dart';

/// Forecast
///
/// Properties:
/// * [area] 
/// * [forecast] 
@BuiltValue()
abstract class Forecast implements Built<Forecast, ForecastBuilder> {
  @BuiltValueField(wireName: r'area')
  String get area;

  @BuiltValueField(wireName: r'forecast')
  String get forecast;

  Forecast._();

  factory Forecast([void updates(ForecastBuilder b)]) = _$Forecast;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ForecastBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast> get serializer => _$ForecastSerializer();
}

class _$ForecastSerializer implements PrimitiveSerializer<Forecast> {
  @override
  final Iterable<Type> types = const [Forecast, _$Forecast];

  @override
  final String wireName = r'Forecast';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Forecast object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'area';
    yield serializers.serialize(
      object.area,
      specifiedType: const FullType(String),
    );
    yield r'forecast';
    yield serializers.serialize(
      object.forecast,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Forecast object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ForecastBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'area':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.area = valueDes;
          break;
        case r'forecast':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.forecast = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Forecast deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ForecastBuilder();
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

