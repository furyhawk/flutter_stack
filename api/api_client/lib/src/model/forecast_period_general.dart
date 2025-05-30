//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forecast_period_general.g.dart';

/// ForecastPeriodGeneral
///
/// Properties:
/// * [start] 
/// * [end] 
/// * [text] 
@BuiltValue()
abstract class ForecastPeriodGeneral implements Built<ForecastPeriodGeneral, ForecastPeriodGeneralBuilder> {
  @BuiltValueField(wireName: r'start')
  DateTime get start;

  @BuiltValueField(wireName: r'end')
  DateTime get end;

  @BuiltValueField(wireName: r'text')
  String get text;

  ForecastPeriodGeneral._();

  factory ForecastPeriodGeneral([void updates(ForecastPeriodGeneralBuilder b)]) = _$ForecastPeriodGeneral;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ForecastPeriodGeneralBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ForecastPeriodGeneral> get serializer => _$ForecastPeriodGeneralSerializer();
}

class _$ForecastPeriodGeneralSerializer implements PrimitiveSerializer<ForecastPeriodGeneral> {
  @override
  final Iterable<Type> types = const [ForecastPeriodGeneral, _$ForecastPeriodGeneral];

  @override
  final String wireName = r'ForecastPeriodGeneral';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ForecastPeriodGeneral object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'start';
    yield serializers.serialize(
      object.start,
      specifiedType: const FullType(DateTime),
    );
    yield r'end';
    yield serializers.serialize(
      object.end,
      specifiedType: const FullType(DateTime),
    );
    yield r'text';
    yield serializers.serialize(
      object.text,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ForecastPeriodGeneral object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ForecastPeriodGeneralBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.start = valueDes;
          break;
        case r'end':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.end = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ForecastPeriodGeneral deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ForecastPeriodGeneralBuilder();
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

