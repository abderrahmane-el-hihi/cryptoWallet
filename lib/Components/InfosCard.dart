import 'package:flutter/material.dart';

class InfosCard extends StatefulWidget {
  String status;
  String date;
  String rate;

  InfosCard(
      {super.key,
      required this.date,
      required this.rate,
      required this.status});

  @override
  State<InfosCard> createState() => _InfosCardState();
}

class _InfosCardState extends State<InfosCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "From",
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                Text(
                  widget.status,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Divider(
                color: Colors.grey.shade400,
                thickness: .5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                Text(
                  widget.date,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Divider(
                color: Colors.grey.shade400,
                thickness: .5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rate",
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                Text(
                  widget.rate,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
