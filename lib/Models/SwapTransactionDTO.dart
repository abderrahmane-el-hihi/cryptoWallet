import 'dart:convert';

List<SwapTransactionDto> swapTransactionDtoFromJson(String str) =>
    List<SwapTransactionDto>.from(
        json.decode(str).map((x) => SwapTransactionDto.fromJson(x)));

String swapTransactionDtoToJson(List<SwapTransactionDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SwapTransactionDto {
  int transactionid;
  int cryptoid1;
  int cryptoid2;
  int amount1;
  int amount2;
  DateTime transactiondate;

  SwapTransactionDto({
    required this.transactionid,
    required this.cryptoid1,
    required this.cryptoid2,
    required this.amount1,
    required this.amount2,
    required this.transactiondate,
  });

  factory SwapTransactionDto.fromJson(Map<String, dynamic> json) =>
      SwapTransactionDto(
        transactionid: json["transactionid"],
        cryptoid1: json["cryptoid1"],
        cryptoid2: json["cryptoid2"],
        amount1: json["amount1"],
        amount2: json["amount2"],
        transactiondate: DateTime.parse(json["transactiondate"]),
      );

  Map<String, dynamic> toJson() => {
        "transactionid": transactionid,
        "cryptoid1": cryptoid1,
        "cryptoid2": cryptoid2,
        "amount1": amount1,
        "amount2": amount2,
        "transactiondate": transactiondate.toIso8601String(),
      };
}
