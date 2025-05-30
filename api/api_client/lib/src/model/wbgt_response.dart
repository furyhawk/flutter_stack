//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/wbgt_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wbgt_response.g.dart';

/// WBGTResponse
///
/// Properties:
/// * [code] 
/// * [errorMsg] 
/// * [data] 
@BuiltValue()
abstract class WBGTResponse implements Built<WBGTResponse, WBGTResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int get code;

  @BuiltValueField(wireName: r'errorMsg')
  String? get errorMsg;

  @BuiltValueField(wireName: r'data')
  WBGTData? get data;

  WBGTResponse._();

  factory WBGTResponse([void updates(WBGTResponseBuilder b)]) = _$WBGTResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WBGTResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WBGTResponse> get serializer => _$WBGTResponseSerializer();
}

class _$WBGTResponseSerializer implements PrimitiveSerializer<WBGTResponse> {
  @override
  final Iterable<Type> types = const [WBGTResponse, _$WBGTResponse];

  @override
  final String wireName = r'WBGTResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WBGTResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(int),
    );
    if (object.errorMsg != null) {
      yield r'errorMsg';
      yield serializers.serialize(
        object.errorMsg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(WBGTData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WBGTResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WBGTResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'errorMsg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMsg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(WBGTData),
          ) as WBGTData?;
          if (valueDes == null) continue;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WBGTResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WBGTResponseBuilder();
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

