// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeRequest _$LikeRequestFromJson(Map<String, dynamic> json) => LikeRequest(
      type: json['type'] as String?,
      textId: json['textId'] as int?,
      cat: json['cat'] as int?,
    );

Map<String, dynamic> _$LikeRequestToJson(LikeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('textId', instance.textId);
  writeNotNull('cat', instance.cat);
  return val;
}
