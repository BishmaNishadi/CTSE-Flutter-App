import 'package:find_seat/presentation/common_widgets/widget_spacer.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

import 'Export_Widgets.dart';

class Home extends StatefulWidget{
  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: COLOR_CONST.WHITE,
        child: ListView(
          children: <Widget>[
            WidgetHomeToolbar(),
            WidgetBanner(),
            WidgetSpacer(height: 30),
            WidgetHomeCategories(),
            WidgetSpacer(height: 30),
            WidgetRecommendedSeats(),
            WidgetSpacer(height: 30),
            WidgetNearbyTheatres(),
           WidgetSpacer(height: 30),
            WidgetHomeEvents(),
            WidgetSpacer(height: 30),
            WidgetHomePlays(),
            WidgetSpacer(height: 30),
          ],
        ),
      ),
    );
  }
}
