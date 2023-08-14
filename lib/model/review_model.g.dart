// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      name: json['name'] as String?,
      rating: json['rating'] as int?,
      comment: json['comment'] as String?,
      rid: json['_id'] as String?,
      reviewId: json['reviewId'] as int? ?? 0,
    )..image = json['image'] as String?;

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'reviewId': instance.reviewId,
      '_id': instance.rid,
      'name': instance.name,
      'rating': instance.rating,
      'comment': instance.comment,
      'image': instance.image,
    };
