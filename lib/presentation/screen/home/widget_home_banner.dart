import 'package:flutter/material.dart';

class WidgetHomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("images/top.png",
        fit: BoxFit.contain,
      ),
    );
  }
}
