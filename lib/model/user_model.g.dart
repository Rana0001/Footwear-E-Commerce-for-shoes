// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      uid: json['_id'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => AddToCart.fromJson(e as Map<String, dynamic>))
          .toList(),
      transaction: (json['transaction'] as List<dynamic>?)
          ?.map((e) => UserTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileURL: json['profileURL'] as String?,
      role: json['role'] as String?,
      order: (json['order'] as List<dynamic>?)
          ?.map((e) => UserOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: json['userId'] as int? ?? 0,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      '_id': instance.uid,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'profileURL': instance.profileURL,
      'role': instance.role,
      'order': instance.order,
      'address': instance.address,
      'cart': instance.cart,
      'transaction': instance.transaction,
    };
