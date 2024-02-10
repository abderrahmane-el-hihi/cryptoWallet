import 'dart:convert';

CoinDto coinDtoFromJson(String str) => CoinDto.fromJson(json.decode(str));

String coinDtoToJson(CoinDto data) => json.encode(data.toJson());

class CoinDto {
  Data data;

  CoinDto({
    required this.data,
  });

  factory CoinDto.fromJson(Map<String, dynamic> json) => CoinDto(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  int marketCap;
  int marketCapDiluted;
  int liquidity;
  double price;
  int offChainVolume;
  int volume;
  double volumeChange24H;
  int volume7D;
  bool isListed;
  double priceChange24H;
  double priceChange1H;
  double priceChange7D;
  double priceChange1M;
  double priceChange1Y;
  double ath;
  double atl;
  String name;
  String symbol;
  String logo;
  int rank;

  Data({
    required this.marketCap,
    required this.marketCapDiluted,
    required this.liquidity,
    required this.price,
    required this.offChainVolume,
    required this.volume,
    required this.volumeChange24H,
    required this.volume7D,
    required this.isListed,
    required this.priceChange24H,
    required this.priceChange1H,
    required this.priceChange7D,
    required this.priceChange1M,
    required this.priceChange1Y,
    required this.ath,
    required this.atl,
    required this.name,
    required this.symbol,
    required this.logo,
    required this.rank,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        marketCap: json["market_cap"],
        marketCapDiluted: json["market_cap_diluted"],
        liquidity: json["liquidity"],
        price: json["price"]?.toDouble(),
        offChainVolume: json["off_chain_volume"],
        volume: json["volume"],
        volumeChange24H: json["volume_change_24h"]?.toDouble(),
        volume7D: json["volume_7d"],
        isListed: json["is_listed"],
        priceChange24H: json["price_change_24h"]?.toDouble(),
        priceChange1H: json["price_change_1h"]?.toDouble(),
        priceChange7D: json["price_change_7d"]?.toDouble(),
        priceChange1M: json["price_change_1m"]?.toDouble(),
        priceChange1Y: json["price_change_1y"]?.toDouble(),
        ath: json["ath"]?.toDouble(),
        atl: json["atl"]?.toDouble(),
        name: json["name"],
        symbol: json["symbol"],
        logo: json["logo"],
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "market_cap": marketCap,
        "market_cap_diluted": marketCapDiluted,
        "liquidity": liquidity,
        "price": price,
        "off_chain_volume": offChainVolume,
        "volume": volume,
        "volume_change_24h": volumeChange24H,
        "volume_7d": volume7D,
        "is_listed": isListed,
        "price_change_24h": priceChange24H,
        "price_change_1h": priceChange1H,
        "price_change_7d": priceChange7D,
        "price_change_1m": priceChange1M,
        "price_change_1y": priceChange1Y,
        "ath": ath,
        "atl": atl,
        "name": name,
        "symbol": symbol,
        "logo": logo,
        "rank": rank,
      };
}
