// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrder _$UserOrderFromJson(Map<String, dynamic> json) => UserOrder(
      id: json['id'] as int? ?? 0,
      orderId: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantity: json['quantity'] as String?,
      color: json['color'] as String?,
      total: json['total'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserOrderToJson(UserOrder instance) => <String, dynamic>{
      'id': instance.id,
      '_id': instance.orderId,
      'user': instance.user,
      'product': instance.product,
      'quantity': instance.quantity,
      'color': instance.color,
      'total': instance.total,
      'status': instance.status,
    };
