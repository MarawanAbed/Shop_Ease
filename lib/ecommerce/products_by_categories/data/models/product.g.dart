// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsByCategoriesProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsByCategoriesProductsModel(
      id: json['id'] as int,
      price: (json['price'] as num).toDouble(),
      oldPrice: (json['old_price'] as num?)?.toDouble(),
      discount: json['discount'] as int,
      image: json['image'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsByCategoriesProductsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'images': instance.images,
    };
