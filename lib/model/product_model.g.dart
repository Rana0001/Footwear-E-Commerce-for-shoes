// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      title: json['title'] as String?,
      size: (json['size'] as List<dynamic>?)?.map((e) => e as String).toList(),
      color:
          (json['color'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as String?,
      items: json['items'] as int?,
      brand: json['brand'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pid: json['_id'] as String?,
      review: (json['review'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      productId: json['productId'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      '_id': instance.pid,
      'title': instance.title,
      'size': instance.size,
      'color': instance.color,
      'price': instance.price,
      'items': instance.items,
      'images': instance.images,
      'brand': instance.brand,
      'review': instance.review,
    };
