import 'package:footwear/model/transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_response.g.dart';

@JsonSerializable()
class TransactionDataResponse {
  bool? status;
  UserTransaction? data;

  TransactionDataResponse({this.status, this.data});

  factory TransactionDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionDataResponseToJson(this);
}
