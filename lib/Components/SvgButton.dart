import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgButton extends StatefulWidget {
  void Function()? onPressed;
  String title;
  String imgsrc;

  SvgButton(
      {super.key,
      required this.imgsrc,
      required this.onPressed,
      required this.title});

  @override
  State<SvgButton> createState() => _SvgButtonState();
}

class _SvgButtonState extends State<SvgButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.inversePrimary))),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            elevation: const MaterialStatePropertyAll(1),
          ),
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(widget.imgsrc),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Text(widget.title),
              ],
            ),
          )),
    );
  }
}
