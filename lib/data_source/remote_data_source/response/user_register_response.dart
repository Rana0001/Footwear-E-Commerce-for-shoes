import 'package:footwear/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  bool? success;
  String? message;
  List<User>? data;

  RegisterResponse({this.success, this.message, this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
