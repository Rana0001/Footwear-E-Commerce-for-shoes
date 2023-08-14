import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'review_model.g.dart';

@JsonSerializable()
@Entity()
class Review {
  @Id(assignable: true)
  int reviewId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? rid;
  String? name;
  int? rating;
  String? comment;
  String? image;

  Review({this.name, this.rating, this.comment, this.rid, this.reviewId = 0});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
