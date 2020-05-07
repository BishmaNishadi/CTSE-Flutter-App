import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Image.asset("images/banner.jpg",

        fit: BoxFit.contain,
      ),
    );
  }
}
