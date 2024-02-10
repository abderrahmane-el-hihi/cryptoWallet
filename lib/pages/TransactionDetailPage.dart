import 'package:anima/Components/InfosCard.dart';
import 'package:anima/Components/TransactionCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetailPage extends StatefulWidget {
  String fromcoinSymbol;
  String tocoinSymbol;
  double fromcoinamount;
  double tocoinamount;
  String fromcoinImage;
  String tocoinImage;
  // String status;
  // String date;
  // double rate;
  TransactionDetailPage({
    super.key,
    required this.fromcoinImage,
    required this.fromcoinSymbol,
    required this.fromcoinamount,
    required this.tocoinImage,
    required this.tocoinSymbol,
    required this.tocoinamount,
    // required this.date,
    // required this.rate,
    // required this.status,
  });

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
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
            TransactionCard(
              fromcoinImage: widget.fromcoinImage,
              fromcoinSymbol: widget.fromcoinSymbol,
              fromcoinamount: widget.fromcoinamount,
              tocoinImage: widget.tocoinImage,
              tocoinSymbol: widget.tocoinSymbol,
              tocoinamount: widget.tocoinamount,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            InfosCard(
                date: DateFormat('d MMM, yyyy').format(DateTime.now()),
                rate: "1 ${widget.fromcoinSymbol} = 1 ${widget.tocoinSymbol}",
                status: "in Progress"),
          ],
        ),
      )),
    );
  }
}
