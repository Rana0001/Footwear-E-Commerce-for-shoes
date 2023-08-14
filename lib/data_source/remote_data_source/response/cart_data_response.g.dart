// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDataResponse _$CartDataResponseFromJson(Map<String, dynamic> json) =>
    CartDataResponse(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : AddToCart.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartDataResponseToJson(CartDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
