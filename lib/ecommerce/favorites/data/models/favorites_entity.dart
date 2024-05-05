
import 'package:hive/hive.dart';

part 'favorites_entity.g.dart';

@HiveType(typeId: 0)
class FavoriteModel
{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final int discount;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String? language;


  FavoriteModel({
    required this.id,
    required this.price,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.language,
  });

  FavoriteModel copyWith({
    int? id,
    String? name,
    double? price,
    String? image,
    String? description,
    int? discount,
    String? language,
  }) {
    return FavoriteModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      discount: discount ?? this.discount,
      language: language ?? this.language,
    );
  }
}