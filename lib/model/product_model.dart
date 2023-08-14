import 'package:footwear/model/review_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'product_model.g.dart';

@JsonSerializable()
@Entity()
class Product {
  @Id(assignable: true)
  int productId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? pid;
  String? title;
  List<String>? size;
  List<String>? color;
  String? price;
  int? items;
  List<String>? images;
  String? brand;
  List<Review>? review;

  Product(
      {this.title,
      this.size,
      this.color,
      this.price,
      this.items,
      this.brand,
      this.images,
      this.pid,
      this.review,
      this.productId = 0});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
