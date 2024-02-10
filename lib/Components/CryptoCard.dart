import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatefulWidget {
  String imageSrc;
  String cryptoName;
  String cryptoSymbole;
  String cryptoAmount;
  String cryptoAmountUsd;
  String cryptoPercentage;
  CryptoCard({
    super.key,
    required this.imageSrc,
    required this.cryptoName,
    required this.cryptoSymbole,
    required this.cryptoAmount,
    required this.cryptoAmountUsd,
    required this.cryptoPercentage,
  });

  @override
  State<CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(62, 189, 189, 189),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ClipOval(
                    child: Image.network(
                      widget.imageSrc,
                      height: 25,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cryptoName,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.cryptoSymbole,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .015,
                        ),
                        Text(
                          widget.cryptoAmount,
                          style: TextStyle(
                              color: Colors.green.shade300,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.cryptoAmountUsd,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.cryptoPercentage,
                  style: TextStyle(
                    color: Colors.orange.shade400,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
