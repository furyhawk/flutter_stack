//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/label_location.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'area_metadata.g.dart';

/// AreaMetadata
///
/// Properties:
/// * [name] 
/// * [labelLocation] 
@BuiltValue()
abstract class AreaMetadata implements Built<AreaMetadata, AreaMetadataBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'label_location')
  LabelLocation get labelLocation;

  AreaMetadata._();

  factory AreaMetadata([void updates(AreaMetadataBuilder b)]) = _$AreaMetadata;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AreaMetadataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AreaMetadata> get serializer => _$AreaMetadataSerializer();
}

class _$AreaMetadataSerializer implements PrimitiveSerializer<AreaMetadata> {
  @override
  final Iterable<Type> types = const [AreaMetadata, _$AreaMetadata];

  @override
  final String wireName = r'AreaMetadata';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AreaMetadata object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'label_location';
    yield serializers.serialize(
      object.labelLocation,
      specifiedType: const FullType(LabelLocation),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AreaMetadata object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AreaMetadataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'label_location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LabelLocation),
          ) as LabelLocation;
          result.labelLocation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AreaMetadata deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AreaMetadataBuilder();
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

