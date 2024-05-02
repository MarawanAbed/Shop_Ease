import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';
@JsonSerializable()
class HomeDetailsProductModel
{
  final int id;
  final double price;
  @JsonKey(name: 'old_price')
  final double? oldPrice;
  final int discount;
  final String name;
  final String image;
  final String description;
  final List<String> images;

  HomeDetailsProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.description,
    required this.images,
    required this.name,
  });

  factory HomeDetailsProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}