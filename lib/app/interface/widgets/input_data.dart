import 'package:flutter/material.dart';

class InputFormData extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final Color corText;
  final bool ocultar;
  // ignore: use_key_in_widget_constructors
  const InputFormData({
    required this.controller,
    required this.text,
    required this.corText,
    required this.ocultar,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      obscureText: ocultar,
      decoration: InputDecoration(
        hintText: text,
        contentPadding: const EdgeInsets.fromLTRB(12, 16, 16, 16),
        enabled: true,
        hintStyle: TextStyle(
          color: corText,
          fontSize: 16,
        ),
        fillColor: corText,
        hoverColor: corText,
      ),
    );
  }
}
