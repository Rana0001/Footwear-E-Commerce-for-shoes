import 'package:footwear/data_source/remote_data_source/response/get_order_response.dart';
import 'package:footwear/model/order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderDataResponse {
  bool? status;
  UserOrder? data;

  OrderDataResponse({this.status, this.data});

  factory OrderDataResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDataResponseToJson(this);
}
