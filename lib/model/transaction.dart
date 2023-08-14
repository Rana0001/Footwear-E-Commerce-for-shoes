import 'package:footwear/model/product_model.dart';
import 'package:footwear/model/user_model.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'transaction.g.dart';

@JsonSerializable()
@Entity()
class UserTransaction {
  @Id(assignable: true)
  int id;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? transactionId;
  User? user;
  List<Product>? product;
  String? quantity;
  String? status;
  String? total;

  UserTransaction(
      {this.id = 0,
      this.transactionId,
      this.user,
      this.product,
      this.quantity,
      this.status,
      this.total});

  factory UserTransaction.fromJson(Map<String, dynamic> fromJson) =>
      _$UserTransactionFromJson(fromJson);
  Map<String, dynamic> toJson() => _$UserTransactionToJson(this);
}
