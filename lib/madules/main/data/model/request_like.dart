import 'package:my_self/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_like.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class LikeRequest implements BaseModel<LikeRequest> {
  LikeRequest({this.type,this.textId,this.cat});

  String? type;
  int? textId;
  int? cat;

  @override
  factory LikeRequest.fromJson(Map<String, dynamic> json) =>
      _$LikeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LikeRequestToJson(this);
}
