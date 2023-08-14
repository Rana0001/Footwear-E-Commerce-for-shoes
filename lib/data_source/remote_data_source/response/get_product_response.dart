import 'package:footwear/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? success;
  List<Product>? data;

  ProductResponse({this.success, this.data});
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
