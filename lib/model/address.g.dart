// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      aid: json['aid'] as int? ?? 0,
      addressId: json['_id'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'aid': instance.aid,
      '_id': instance.addressId,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'user': instance.user,
    };
