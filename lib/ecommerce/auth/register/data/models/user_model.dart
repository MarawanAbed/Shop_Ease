import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uId;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String?image;
  final String dataSource;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.image,
    required this.dataSource,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
