import 'package:footwear/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  bool? success;
  User? data;

  UserDataResponse({this.success, this.data});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}
