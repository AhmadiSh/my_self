// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      cLike: json['cLike'] as int?,
      cView: json['cView'] as int?,
      catName: json['catName'] as String?,
      id: json['id'] as int?,
      isLike: json['isLike'] as bool?,
      subCat: json['subCat'] as String?,
      text: json['text'] as String?,
      cat: json['cat'] as int?,
      isDislike: json['isDislike'] as bool?,
    );

Map<String, dynamic> _$PostToJson(Post instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('text', instance.text);
  writeNotNull('cLike', instance.cLike);
  writeNotNull('cView', instance.cView);
  writeNotNull('catName', instance.catName);
  writeNotNull('subCat', instance.subCat);
  writeNotNull('isLike', instance.isLike);
  writeNotNull('cat', instance.cat);
  writeNotNull('isDislike', instance.isDislike);
  return val;
}
