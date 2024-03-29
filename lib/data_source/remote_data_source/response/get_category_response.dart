import 'package:footwear/model/category_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  bool? success;
  List<Category>? data;

  CategoryResponse({this.success, this.data});
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

