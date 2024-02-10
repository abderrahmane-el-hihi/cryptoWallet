import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final controller;
  int? maxLines;
  bool obscureText;
  String title;
  IconData? suffIcon, suffIcon2;

  TextInput({
    super.key,
    required this.controller,
    this.maxLines = 1,
    required this.obscureText,
    required this.title,
    this.suffIcon,
    this.suffIcon2,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          label: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
            child: Icon(
              widget.obscureText ? widget.suffIcon : widget.suffIcon2,
              color: widget.obscureText
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: Color.fromRGBO(179, 179, 179, 1))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          fillColor: Colors.transparent,
          filled: true,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(179, 179, 179, 1)),
        ),
      ),
    );
  }
}
