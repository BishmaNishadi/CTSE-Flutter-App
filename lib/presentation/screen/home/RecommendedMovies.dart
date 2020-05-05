import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class RecommendedMovies extends StatelessWidget {
  List<_ImageRecommendedMovies> items = [
    _ImageRecommendedMovies(
        "images/movie/kathuru_mithuru.png", "Kathuru Mithuru", 90),
    _ImageRecommendedMovies(
        "images/movie/recommended_2.jpg", "Kaala", 85),
    _ImageRecommendedMovies(
        "images/movie/thaala.jpg", "Thaala",84),
    _ImageRecommendedMovies(
        "images/movie/rush.png", "Rush", 87),
    _ImageRecommendedMovies(
        "images/movie/vijayaba_kollaya.png", "Vijayabaha Kollaya", 91)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WidgetSpacer(height: 14),
        _RecommendedMovies(),
          Text('RECOMMENDED MOVIES',
              style: FONT_CONST.MEDIUM_BLACK2_14),

        ],
      ),
    );
  }

  _RecommendedMovies() {
    return Container(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var it = items[index];

            return _WidgetRecommendedMovies(it);
          },
          separatorBuilder: (context, index) {
            return WidgetSpacer(width: 14);
          },
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
        ),
      ),
    );
  }
}

class _WidgetRecommendedMovies extends StatelessWidget {
  _ImageRecommendedMovies item;

  _WidgetRecommendedMovies(this.item);

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    context = context;

    return GestureDetector(
      onTap: () {
        openShowDetails();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item.image,
              width: 90,
              height: 124,
              fit: BoxFit.contain,
            ),
          ),
          WidgetSpacer(height: 4),
          Text(item.des, style: FONT_CONST.REGULAR_BLACK2_12),
          WidgetSpacer(height: 2),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: COLOR_CONST.DEFAULT,
                size: 14,
              ),
              WidgetSpacer(width: 6),
              Text('${item.rate}%', style: FONT_CONST.REGULAR_GRAY6_10)
            ],
          ),
        ],
      ),
    );
  }

  void openShowDetails() {
    Navigator.pushNamed(context, Router.SHOW_INFO);
  }
}

class _ImageRecommendedMovies {
  String image;
  String des;
  int rate;

  _ImageRecommendedMovies(this.image, this.des, this.rate);
}
