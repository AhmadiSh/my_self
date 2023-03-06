// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseUserAdapter extends TypeAdapter<ResponseUser> {
  @override
  final int typeId = 2;

  @override
  ResponseUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseUser(
      token: fields[0] as String?,
      userID: fields[1] as String?,
      userIP: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ResponseUser obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.userID)
      ..writeByte(2)
      ..write(obj.userIP);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUser _$ResponseUserFromJson(Map<String, dynamic> json) => ResponseUser(
      message: json['message'] as String?,
      token: json['token'] as String?,
      userID: json['userID'] as String?,
      userIP: json['userIP'] as String?,
    );

Map<String, dynamic> _$ResponseUserToJson(ResponseUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('token', instance.token);
  writeNotNull('userID', instance.userID);
  writeNotNull('userIP', instance.userIP);
  return val;
}
