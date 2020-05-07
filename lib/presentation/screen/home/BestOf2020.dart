import 'package:find_seat/presentation/MainWidgetsCollection/MainWidgets.dart';
import 'package:flutter/material.dart';

class BestOf2020Movies extends StatelessWidget {
  List<ItemPosterVM> items = [
    ItemPosterVM('images/movie/vijayaba_kollaya.png',
        'Viyayabaha Kollaya', 'Action'),
    ItemPosterVM('images/movie/husma.jpg',
        'Husma', 'Horror'),
    ItemPosterVM('images/movie/mulan.jpg',
        'Mulan', 'Thriller'),
    ItemPosterVM('images/movie/malang.jpg',
        'Malang', 'Romantic'),
  ];

  @override
  Widget build(BuildContext context) {
    return WidgetHomePosters(
      items: items,
      label: 'Best of 2020',
      iconPath: 'assets/ic_plays.svg',
    );
  }
}
