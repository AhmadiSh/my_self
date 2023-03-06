import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_self/core/base/base_model.dart';
import 'package:my_self/core/constants/hive_types.dart';

part 'response_user.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@HiveType(typeId: HiveTypes.authUser)
class ResponseUser extends HiveObject implements BaseModel<ResponseUser> {
  ResponseUser({
    this.message,
    this.token,
    this.userID,
    this.userIP,
  });
  final String? message;
  @HiveField(0)
  final String? token;
  @HiveField(1)
  final String? userID;
  @HiveField(2)
  final String? userIP;

  @override
  factory ResponseUser.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseUserToJson(this);
}
