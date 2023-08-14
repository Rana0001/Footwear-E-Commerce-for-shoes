import 'package:footwear/model/transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_transaction_response.g.dart';

@JsonSerializable()
class TransactionResponse {
  bool? status;
  List<UserTransaction>? data;

  TransactionResponse({this.status, this.data});

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}
