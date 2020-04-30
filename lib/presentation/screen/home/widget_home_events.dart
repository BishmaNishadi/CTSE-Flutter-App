import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetHomeEvents extends StatelessWidget {
  List<ItemPosterVM> items = [
    ItemPosterVM('images/movie/alevel.jpg',
        'Happy Halloween 2K19', 'Music show'),
    ItemPosterVM('images/movie/dharmayu.jpg',
        'Music DJ king monger Sertical Visa', 'Music show'),
    ItemPosterVM('images/movie/garasarapa.jpg',
        'Summer sounds festival', 'Comedy show'),
    ItemPosterVM('images/movie/seya.jpg',
        'Happy Halloween 2K19', 'Music show'),
    ItemPosterVM('images/movie/pathini.jpg',
        'Happy Halloween 2K19', 'Music show'),
  ];

  @override
  Widget build(BuildContext context) {
    return WidgetHomePosters(
      items: items,
      label: 'Top Rated Movies',
      iconPath: 'assets/ic_events.svg',
    );
  }
}
