import 'package:anima/Components/CryptoCoin.dart';
import 'package:flutter/material.dart';

class Card extends StatefulWidget {
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade400, strokeAlign: .5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CryptoCoin(
            cryptoCoin: 12.1,
            cryptoCoinName: "BTC",
            imageSrc: '',
          ),
          CryptoCoin(
            cryptoCoin: 1819.223,
            cryptoCoinName: "SOL",
            imageSrc: '',
          ),
        ],
      ),
    );
  }
}
