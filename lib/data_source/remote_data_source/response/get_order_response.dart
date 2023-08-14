
import 'package:footwear/model/order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_order_response.g.dart';

@JsonSerializable()
class OrderResponse {
  bool? status;
  List<UserOrder>? data;

  OrderResponse({this.status, this.data});

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);

}
