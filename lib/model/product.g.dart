// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      key: json['key'] as String?,
      quantidade: (json['quantidade'] as num).toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'quantidade': instance.quantidade,
    };
