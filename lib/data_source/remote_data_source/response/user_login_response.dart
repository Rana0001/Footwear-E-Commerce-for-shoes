import 'package:footwear/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? success;
  String? message;
  String? token;
  User? user;

  LoginResponse({this.success, this.message, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
