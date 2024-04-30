import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';
@JsonSerializable()
class BannerModel
{
  final int? id;
  final String? image;


  BannerModel({
    required this.id,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}