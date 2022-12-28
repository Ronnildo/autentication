import 'package:flutter/material.dart';

class TextDetector extends StatelessWidget {
  final void Function() onTap;
  final String text;
  // ignore: use_key_in_widget_constructors
  const TextDetector({
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          decoration: TextDecoration.underline,
          decorationColor: Colors.black,
        ),
      ),
    );
  }
}
