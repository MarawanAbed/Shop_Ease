// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAccountModel _$MyAccountModelFromJson(Map<String, dynamic> json) =>
    MyAccountModel(
      uId: json['uId'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String?,
      dataSource: json['dataSource'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$MyAccountModelToJson(MyAccountModel instance) =>
    <String, dynamic>{
      'uId': instance.uId,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'image': instance.image,
      'address': instance.address,
      'dataSource': instance.dataSource,
    };
