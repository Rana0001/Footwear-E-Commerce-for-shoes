import 'package:footwear/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'category_model.g.dart';

@JsonSerializable()
@Entity()
class Category {
  @Id(assignable: true)
  int id;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? cId;
  String? name;
  String? section;
  List<Product>? product;

  Category({this.id = 0, this.cId, this.name, this.section, this.product});

  factory Category.fromJson(Map<String, dynamic> fromJson) =>
      _$CategoryFromJson(fromJson);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
