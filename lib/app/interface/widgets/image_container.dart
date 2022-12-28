import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  final Widget widget;
  // ignore: use_key_in_widget_constructors
  const ImageContainer({required this.image, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 100,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      child: widget,
    );
  }
}
