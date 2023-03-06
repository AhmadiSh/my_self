import 'package:json_annotation/json_annotation.dart';
import 'package:my_self/core/base/base_model.dart';
import 'package:my_self/madules/main/data/model/post.dart';

part 'response_post.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class ResponsePost implements BaseModel<ResponsePost> {
  ResponsePost({this.list, this.success,this.test});

  List<Post>? list;
  String? test;
  bool? success;

  @override
  factory ResponsePost.fromJson(Map<String, dynamic> json) =>
      _$ResponsePostFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsePostToJson(this);
}
