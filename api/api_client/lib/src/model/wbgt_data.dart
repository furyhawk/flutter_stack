//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/wbgt_record.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wbgt_data.g.dart';

/// WBGTData
///
/// Properties:
/// * [records] 
/// * [paginationToken] 
@BuiltValue()
abstract class WBGTData implements Built<WBGTData, WBGTDataBuilder> {
  @BuiltValueField(wireName: r'records')
  BuiltList<WBGTRecord> get records;

  @BuiltValueField(wireName: r'paginationToken')
  String? get paginationToken;

  WBGTData._();

  factory WBGTData([void updates(WBGTDataBuilder b)]) = _$WBGTData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WBGTDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WBGTData> get serializer => _$WBGTDataSerializer();
}

class _$WBGTDataSerializer implements PrimitiveSerializer<WBGTData> {
  @override
  final Iterable<Type> types = const [WBGTData, _$WBGTData];

  @override
  final String wireName = r'WBGTData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WBGTData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'records';
    yield serializers.serialize(
      object.records,
      specifiedType: const FullType(BuiltList, [FullType(WBGTRecord)]),
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
    WBGTData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WBGTDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'records':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(WBGTRecord)]),
          ) as BuiltList<WBGTRecord>;
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
  WBGTData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WBGTDataBuilder();
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

