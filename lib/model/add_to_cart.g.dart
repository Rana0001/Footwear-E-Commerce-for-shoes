// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCart _$AddToCartFromJson(Map<String, dynamic> json) => AddToCart(
      id: json['id'] as int? ?? 0,
      cartId: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      status: json['status'] as String?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$AddToCartToJson(AddToCart instance) => <String, dynamic>{
      'id': instance.id,
      '_id': instance.cartId,
      'user': instance.user,
      'product': instance.product,
      'quantity': instance.quantity,
      'status': instance.status,
      'total': instance.total,
    };
