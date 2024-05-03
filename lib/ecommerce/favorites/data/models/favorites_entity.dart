
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


  FavoriteModel({
    required this.id,
    required this.price,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });
}