// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePost _$ResponsePostFromJson(Map<String, dynamic> json) => ResponsePost(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      test: json['test'] as String?,
    );

Map<String, dynamic> _$ResponsePostToJson(ResponsePost instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('list', instance.list?.map((e) => e.toJson()).toList());
  writeNotNull('test', instance.test);
  writeNotNull('success', instance.success);
  return val;
}
