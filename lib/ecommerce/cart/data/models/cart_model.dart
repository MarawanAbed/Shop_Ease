import 'package:hive_flutter/hive_flutter.dart';

part 'cart_model.g.dart';
@HiveType(typeId: 1)
class CartModel
{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
   int quantity;
  @HiveField(4)
   double price;
  @HiveField(5)
  String? language;
  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.language,
  });

}