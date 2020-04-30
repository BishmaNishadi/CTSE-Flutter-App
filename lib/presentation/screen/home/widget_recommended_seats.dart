import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetRecommendedSeats extends StatelessWidget {
  List<_ItemRecommendedSeatVM> items = [
    _ItemRecommendedSeatVM(
        "images/movie/kathuru_mithuru.png", "Kathuru Mithuru", 84),
    _ItemRecommendedSeatVM(
        "images/movie/recommended_2.jpg", "Kaala", 98),
    _ItemRecommendedSeatVM(
        "images/movie/thaala.jpg", "Thaala", 94),
    _ItemRecommendedSeatVM(
        "images/movie/rush.png", "Rush", 87),
    _ItemRecommendedSeatVM(
        "images/movie/vijayaba_kollaya.png", "Vijayabaha Kollaya", 87)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Recommended Movies'.toUpperCase(),
              style: FONT_CONST.MEDIUM_BLACK2_14),
          WidgetSpacer(height: 14),
          _buildListRecommendedSeats(),
        ],
      ),
    );
  }

  _buildListRecommendedSeats() {
    return Container(
      height: 166,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = items[index];

            return _WidgetItemRecommendedSeat(item);
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

class _WidgetItemRecommendedSeat extends StatelessWidget {
  _ItemRecommendedSeatVM item;

  _WidgetItemRecommendedSeat(this.item);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

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
              item.photo,
              width: 90,
              height: 124,
              fit: BoxFit.contain,
            ),
          ),
          WidgetSpacer(height: 4),
          Text(item.title, style: FONT_CONST.REGULAR_BLACK2_12),
          WidgetSpacer(height: 2),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: COLOR_CONST.DEFAULT,
                size: 14,
              ),
              WidgetSpacer(width: 6),
              Text('${item.likePercent}%', style: FONT_CONST.REGULAR_GRAY6_10)
            ],
          ),
        ],
      ),
    );
  }

  void openShowDetails() {
    Navigator.pushNamed(_context, Router.SHOW_INFO);
  }
}

class _ItemRecommendedSeatVM {
  String photo;
  String title;
  int likePercent;

  _ItemRecommendedSeatVM(this.photo, this.title, this.likePercent);
}
