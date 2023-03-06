import 'package:hive/hive.dart';
import 'package:my_self/core/base/base_model.dart';
import 'package:my_self/core/constants/hive_types.dart';

part 'them_model.g.dart';

@HiveType(typeId: HiveTypes.themeModel)
class ThemeModel extends HiveObject implements BaseModel<ThemeModel> {
  @HiveField(0)
  final List<String>? background;
  @HiveField(1)
  final double? fontSize;
  @HiveField(2)
  final String? font;

  ThemeModel({
    this.background,
    this.fontSize,
    this.font,
  });

// @override
// factory ThemeModel.fromJson(Map<String, dynamic> json) => _$ThemeModelFromJson(json);
// Map<String, dynamic> toJson() => _$ThemeModelToJson(this);
}
