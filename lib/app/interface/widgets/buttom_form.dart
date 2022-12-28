import 'package:flutter/material.dart';

class ButtomFormData extends StatelessWidget {
  final String text;
  final void Function() push;
  // ignore: use_key_in_widget_constructors
  const ButtomFormData({required this.text, required this.push});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFFCE38A),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: TextButton(
            onPressed: push,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
