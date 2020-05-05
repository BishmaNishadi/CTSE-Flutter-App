import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class TopRatedMovies extends StatelessWidget {
  List<ItemPosterVM> items = [
    ItemPosterVM('images/movie/alevel.jpg',
        'ALevel', 'Teens Movie'),
    ItemPosterVM('images/movie/dharmayu.jpg',
        'Dharmayuddaya', 'Action Movie'),
    ItemPosterVM('images/movie/garasarapa.jpg',
        'Garasarapa', 'Action Movie'),
    ItemPosterVM('images/movie/seya.jpg',
        'Seya', 'Horror Movie'),
    ItemPosterVM('images/movie/pathini.jpg',
        'Paththini', 'Historical Movie'),
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
