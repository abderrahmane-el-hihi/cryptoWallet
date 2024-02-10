import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionCard extends StatefulWidget {
  String fromcoinSymbol;
  String tocoinSymbol;
  double fromcoinamount;
  double tocoinamount;
  String fromcoinImage;
  String tocoinImage;
  TransactionCard({
    super.key,
    required this.fromcoinImage,
    required this.fromcoinSymbol,
    required this.fromcoinamount,
    required this.tocoinImage,
    required this.tocoinSymbol,
    required this.tocoinamount,
  });

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "${widget.fromcoinamount} ${widget.fromcoinSymbol}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      ClipOval(
                          child: Image.network(
                        widget.fromcoinImage,
                        height: 40,
                      ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: .5,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .04,
                  ),
                  Icon(
                    CupertinoIcons.arrow_down,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "To",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "${widget.tocoinamount} ${widget.tocoinSymbol}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      ClipOval(
                          child: Image.network(
                        widget.tocoinImage,
                        height: 40,
                      ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
