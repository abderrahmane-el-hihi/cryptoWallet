import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CryptoCoin extends StatefulWidget {
  String cryptoCoinName;
  String imageSrc;
  double cryptoCoin;

  CryptoCoin(
      {super.key,
      required this.cryptoCoin,
      required this.cryptoCoinName,
      required this.imageSrc});

  @override
  State<CryptoCoin> createState() => _CryptoCoinState();
}

class _CryptoCoinState extends State<CryptoCoin> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            widget.imageSrc,
            height: 40,
          ),
        ),
        const Gap(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.cryptoCoinName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "${widget.cryptoCoin}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
