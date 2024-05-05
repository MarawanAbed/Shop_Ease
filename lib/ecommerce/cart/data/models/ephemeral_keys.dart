import 'package:json_annotation/json_annotation.dart';
part 'ephemeral_keys.g.dart';
@JsonSerializable()
class EphemeralKeysModel
{
  final String secret;


  EphemeralKeysModel({required this.secret});


  factory EphemeralKeysModel.fromJson(Map<String, dynamic> json) => _$EphemeralKeysModelFromJson(json);


  Map<String, dynamic> toJson() => _$EphemeralKeysModelToJson(this);
}