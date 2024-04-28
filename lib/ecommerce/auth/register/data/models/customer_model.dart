import 'package:json_annotation/json_annotation.dart';
part 'customer_model.g.dart';
@JsonSerializable()
class CustomerModel
{
  final String? id;
  final String name;
  final String email;
  final String phone;


  CustomerModel({ this.id, required this.name, required this.email, required this.phone});


  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);


  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}