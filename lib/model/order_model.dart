import 'package:footwear/model/product_model.dart';
import 'package:footwear/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'order_model.g.dart';

@JsonSerializable()
@Entity()
class UserOrder {
  @Id(assignable: true)
  int id;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? orderId;
  User? user;
  List<Product>? product;
  String? quantity;
  String? color;
  String? total;
  String? status;

  UserOrder(
      {this.id = 0,
      this.orderId,
      this.user,
      this.product,
      this.quantity,
      this.color,
      this.total,
      this.status});

  factory UserOrder.fromJson(Map<String, dynamic> fromJson) =>
      _$UserOrderFromJson(fromJson);
  Map<String, dynamic> toJson() => _$UserOrderToJson(this);
}
