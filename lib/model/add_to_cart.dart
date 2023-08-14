import 'package:footwear/model/product_model.dart';
import 'package:footwear/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'add_to_cart.g.dart';

@JsonSerializable()
@Entity()
class AddToCart {
  @Id(assignable: true)
  int id;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? cartId;
  User? user;
  Product? product;
  int? quantity;
  String? status;
  int? total;

  AddToCart(
      {this.id = 0,
      this.cartId,
      this.user,
      this.product,
      this.quantity,
      this.status,
      this.total});

  factory AddToCart.fromJson(Map<String, dynamic> fromJson) =>
      _$AddToCartFromJson(fromJson);
  Map<String, dynamic> toJson() => _$AddToCartToJson(this);
}
