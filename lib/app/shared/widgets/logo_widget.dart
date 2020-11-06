import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          "assets/images/logo.png",
          key: Key("logo_image_key"),
          scale: 1.5,
        ),
      ),
    );
  }
}
