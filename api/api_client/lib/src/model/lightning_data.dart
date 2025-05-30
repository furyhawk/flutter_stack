//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/lightning_record.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'lightning_data.g.dart';

/// LightningData
///
/// Properties:
/// * [records] 
/// * [paginationToken] 
@BuiltValue()
abstract class LightningData implements Built<LightningData, LightningDataBuilder> {
  @BuiltValueField(wireName: r'records')
  BuiltList<LightningRecord> get records;

  @BuiltValueField(wireName: r'paginationToken')
  String? get paginationToken;

  LightningData._();

  factory LightningData([void updates(LightningDataBuilder b)]) = _$LightningData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LightningDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LightningData> get serializer => _$LightningDataSerializer();
}

class _$LightningDataSerializer implements PrimitiveSerializer<LightningData> {
  @override
  final Iterable<Type> types = const [LightningData, _$LightningData];

  @override
  final String wireName = r'LightningData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LightningData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'records';
    yield serializers.serialize(
      object.records,
      specifiedType: const FullType(BuiltList, [FullType(LightningRecord)]),
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
    LightningData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LightningDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'records':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(LightningRecord)]),
          ) as BuiltList<LightningRecord>;
          result.records.replace(valueDes);
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
  LightningData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LightningDataBuilder();
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

