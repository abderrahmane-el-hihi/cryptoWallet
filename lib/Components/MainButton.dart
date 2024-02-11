import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  void Function()? onPressed;
  String title;
  IconData icondata;
  bool hasIcon;
  MainButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icondata,
      required this.hasIcon});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.inversePrimary))),
            fixedSize: MaterialStatePropertyAll(
              Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * .075),
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            elevation: const MaterialStatePropertyAll(1),
          ),
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.hasIcon == true ? Icon(widget.icondata) : const Text(''),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          )),
    );
  }
}
