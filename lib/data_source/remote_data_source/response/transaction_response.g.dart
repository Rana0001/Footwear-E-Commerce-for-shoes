// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDataResponse _$TransactionDataResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionDataResponse(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : UserTransaction.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionDataResponseToJson(
        TransactionDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
