import 'package:json_annotation/json_annotation.dart';
import 'package:my_self/core/base/base_model.dart';

part 'post.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Post implements BaseModel<Post> {
  Post({
    this.cLike,
    this.cView,
    this.catName,
    this.id,
    this.isLike,
    this.subCat,
    this.text,
    this.cat,
    this.isDislike
  });

  int? id;
  String? text;
  int? cLike;
  int? cView;
  String? catName;
  String? subCat;
  bool? isLike;
  int? cat;
  bool? isDislike;

  @override
  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
