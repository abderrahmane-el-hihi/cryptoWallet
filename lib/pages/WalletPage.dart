import 'dart:developer';

import 'package:anima/Components/CryptoCard.dart';
import 'package:anima/Components/CustomButton.dart';
import 'package:anima/Components/MainBalanceCard.dart';
import 'package:anima/Models/AllCoinsDTO.dart';
import 'package:anima/Models/CoinDTO.dart';
import 'package:anima/pages/NotificationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anima/Services/Service.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<String> coinList = [];
  @override
  void initState() {
    // AllCoinsDto data = Service().getallCoins();
    // Service().getallCoins().then(
    //       (value) => print(value.toString()),
    //     );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            MainBalanceCard(
                amountAddedinLast24h: '+12 %', totaleWalletBalance: "12342"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onPressed: () {},
                  iconData: CupertinoIcons.arrow_up_right,
                  title: "Send",
                ),
                CustomButton(
                  onPressed: () {},
                  iconData: CupertinoIcons.arrow_down_left,
                  title: "Receive",
                ),
                CustomButton(
                  onPressed: () {},
                  iconData: CupertinoIcons.arrow_right,
                  title: "Withdraw",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Assets",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .44,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: FutureBuilder(
                          future: Service().getCoinData(
                            'bitcoin',
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData) {
                              CoinDto coin = snapshot.data;
                              return CryptoCard(
                                imageSrc: coin.data.logo,
                                cryptoName: coin.data.name,
                                cryptoSymbole: coin.data.symbol,
                                cryptoAmount: '12.3',
                                cryptoAmountUsd:
                                    '\$ ${(coin.data.price * 12.3).toStringAsFixed(3)}',
                                cryptoPercentage: "12 %",
                              );
                            }
                            return Center(
                              child: Text('No Data!'),
                            );
                          }),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                  itemCount: 10),
            )
          ],
        ),
      )),
    );
  }
}
