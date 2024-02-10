import 'dart:convert';

AllCoinsDto allCoinsDtoFromJson(String str) =>
    AllCoinsDto.fromJson(json.decode(str));

String allCoinsDtoToJson(AllCoinsDto data) => json.encode(data.toJson());

class AllCoinsDto {
  List<Datum> data;

  AllCoinsDto({
    required this.data,
  });

  factory AllCoinsDto.fromJson(Map<String, dynamic> json) => AllCoinsDto(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  String symbol;

  Datum({
    required this.id,
    required this.name,
    required this.symbol,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
      };
}
