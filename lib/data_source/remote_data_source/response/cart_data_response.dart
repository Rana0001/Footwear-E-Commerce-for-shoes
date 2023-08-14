import 'package:footwear/model/add_to_cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_data_response.g.dart';

@JsonSerializable()
class CartDataResponse {
  bool? status;
  AddToCart? data;

  CartDataResponse({this.status, this.data});

  factory CartDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CartDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CartDataResponseToJson(this);
}
