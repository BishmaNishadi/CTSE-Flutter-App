import 'package:find_seat/presentation/screen/all_shows/barrelAllShows.dart';
import 'package:flutter/material.dart';

class AllShowsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              WidgetAllShowsToolbar(),
              WidgetBanner(),
              Expanded(
                child: WidgetShowGallery(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
