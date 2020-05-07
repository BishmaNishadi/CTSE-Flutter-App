import 'package:find_seat/presentation/MainWidgetsCollection/widget_spacer.dart';
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
            Toolbar(),
            TopBar(),
            WidgetSpacer(height: 30),
            MovieIcons(),
            WidgetSpacer(height: 30),
            RecommendedMovies(),

           WidgetSpacer(height: 30),
            TopRatedMovies(),
            WidgetSpacer(height: 30),
            BestOf2020Movies(),
            WidgetSpacer(height: 30),
            WidgetSpacer(height: 30),
            NearbyCinemas(),
          ],
        ),
      ),
    );
  }
}
