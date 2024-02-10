import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBalanceCard extends StatefulWidget {
  String totaleWalletBalance;
  String amountAddedinLast24h;
  MainBalanceCard({
    super.key,
    required this.totaleWalletBalance,
    required this.amountAddedinLast24h,
  });

  @override
  State<MainBalanceCard> createState() => _MainBalanceCardState();
}

class _MainBalanceCardState extends State<MainBalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: Theme.of(context).colorScheme.inversePrimary,
              strokeAlign: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Totale Wallet Balance in USD',
              style: TextStyle(
                color: Colors.green.shade400,
                fontSize: 16,
              ),
            ),
            Text(
              widget.totaleWalletBalance + ' \$',
              style: TextStyle(
                  color: Colors.orange.shade400,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.arrow_up_right,
                  size: 8,
                  color: Colors.green.shade400,
                ),
                Text(
                  widget.amountAddedinLast24h,
                  style: TextStyle(color: Colors.green.shade400, fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
