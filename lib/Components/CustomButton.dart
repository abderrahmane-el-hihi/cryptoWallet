import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  void Function()? onPressed;
  IconData iconData;
  String title;
  CustomButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.title,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          height: MediaQuery.of(context).size.height * .1,
          width: MediaQuery.of(context).size.width * .2,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Theme.of(context).colorScheme.inversePrimary,
                strokeAlign: .5),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Icon(
                widget.iconData,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 28,
              ),
            ],
          ))),
    );
  }
}
