import 'package:flutter/material.dart';

class WidgetBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Image.asset("images/banner.jpg",

      //child: Image.asset("images/savoyrajagiriya.jpg",

        fit: BoxFit.contain,
      ),
    );
  }
}
