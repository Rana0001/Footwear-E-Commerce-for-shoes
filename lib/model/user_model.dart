import 'package:footwear/model/add_to_cart.dart';
import 'package:footwear/model/address.dart';
import 'package:footwear/model/order_model.dart';
import 'package:footwear/model/transaction.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'user_model.g.dart';

@JsonSerializable()
@Entity()
class User {
  @Id(assignable: true)
  int userId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? uid;
  String? firstName;
  String? lastName;
  String? username;
  String? password;
  String? phoneNumber;
  String? email;
  String? profileURL;
  String? role;

  List<UserOrder>? order;
  Address? address;
  List<AddToCart>? cart;
  List<UserTransaction>? transaction;

  User(
      {this.firstName,
      this.lastName,
      this.username,
      this.password,
      this.phoneNumber,
      this.email,
      this.uid,
      this.address,
      this.cart,
      this.transaction,
      this.profileURL,
      this.role,
      this.order,
      this.userId = 0});

  factory User.fromJson(Map<String, dynamic> fromJson) =>
      _$UserFromJson(fromJson);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
