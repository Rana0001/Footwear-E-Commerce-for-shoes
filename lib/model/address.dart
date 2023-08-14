import 'package:footwear/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'address.g.dart';

@JsonSerializable()
@Entity()
class Address {
  @Id(assignable: true)
  int aid;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? addressId;
  String? address;
  String? city;
  String? state;
  String? country;
  User? user;

  Address(
      {this.aid = 0,
      this.addressId,
      this.address,
      this.city,
      this.state,
      this.country,
      this.user});

  factory Address.fromJson(Map<String, dynamic> fromJson) =>
      _$AddressFromJson(fromJson);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
