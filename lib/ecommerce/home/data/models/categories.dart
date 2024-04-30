import 'package:json_annotation/json_annotation.dart';
part 'categories.g.dart';
@JsonSerializable()
class CategoriesModel {

  final int? id;
  final String? name;
  final String? image;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

}