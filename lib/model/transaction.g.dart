// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTransaction _$UserTransactionFromJson(Map<String, dynamic> json) =>
    UserTransaction(
      id: json['id'] as int? ?? 0,
      transactionId: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantity: json['quantity'] as String?,
      status: json['status'] as String?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$UserTransactionToJson(UserTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      '_id': instance.transactionId,
      'user': instance.user,
      'product': instance.product,
      'quantity': instance.quantity,
      'status': instance.status,
      'total': instance.total,
    };
