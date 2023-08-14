// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDataResponse _$OrderDataResponseFromJson(Map<String, dynamic> json) =>
    OrderDataResponse(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : UserOrder.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDataResponseToJson(OrderDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
