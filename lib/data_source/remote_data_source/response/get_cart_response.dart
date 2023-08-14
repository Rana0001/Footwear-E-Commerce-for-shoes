

import 'package:footwear/model/add_to_cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  bool? status;
  List<AddToCart>? data;

  CartResponse({this.status, this.data});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);

}
