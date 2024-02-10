import 'package:anima/Models/CoinDTO.dart';
import 'package:anima/Services/Service.dart';
import 'package:anima/pages/TransactionDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Components/CryptoCoin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Service().getCoinData("bitcoin", 'btc');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        title: const Text(
          "Transactions History",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            // Card(),
            // Card(),
            // Card(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: GestureDetector(
                          onTap: () async {
                            CoinDto coin1 =
                                await Service().getCoinData('bitcoin');
                            CoinDto coin2 =
                                await Service().getCoinData('solana');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TransactionDetailPage(
                                          fromcoinImage: coin1.data.logo,
                                          fromcoinSymbol: coin1.data.symbol,
                                          fromcoinamount: 12.1,
                                          tocoinImage: coin2.data.logo,
                                          tocoinSymbol: coin2.data.symbol,
                                          tocoinamount: 1277.1,
                                        )));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .01,
                                ),
                                FutureBuilder(
                                    future: Service().getCoinData(
                                      'bitcoin',
                                    ),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center();
                                      } else if (snapshot.hasData) {
                                        CoinDto data = snapshot.data;

                                        return CryptoCoin(
                                            cryptoCoin: 12.1,
                                            cryptoCoinName:
                                                data.data.symbol.toUpperCase(),
                                            imageSrc: data.data.logo);
                                      } else {
                                        return const Center(
                                          child: Text("No Data!"),
                                        );
                                      }
                                    }),
                                Icon(Icons.compare_arrows_rounded,
                                    color: Colors.grey.shade400),
                                FutureBuilder(
                                    future: Service().getCoinData(
                                      'solana',
                                    ),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center();
                                      } else if (snapshot.hasData) {
                                        CoinDto data = snapshot.data;

                                        return CryptoCoin(
                                            cryptoCoin: 1277.1,
                                            cryptoCoinName:
                                                data.data.symbol.toUpperCase(),
                                            imageSrc: data.data.logo);
                                      } else {
                                        return const Center(
                                          child: Text("No Data!"),
                                        );
                                      }
                                    }),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                  itemCount: 5),
            ),
          ],
        ),
      )),
    );
  }
}
