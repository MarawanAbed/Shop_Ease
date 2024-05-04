import 'package:json_annotation/json_annotation.dart';

part 'my_account.g.dart';

@JsonSerializable()
class MyAccountModel {
  final String? uId;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String?image;
  final String address;
  final String dataSource;

  MyAccountModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.image,
    required this.dataSource,
    required this.address,
  });

  factory MyAccountModel.fromJson(Map<String, dynamic> json) =>
      _$MyAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyAccountModelToJson(this);
}
