import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetDisplayReview2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(color: COLOR_CONST.WHITE),
      child: Column(
        children: <Widget>[
          WidgetSpacer(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  'images/casts/reviewer.jpg',
                  width: 24,
                  height: 24,
                ),
              ),
              WidgetSpacer(width: 8),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Ravindu Bandara', style: FONT_CONST.MEDIUM_GRAY4_10),
                        WidgetSpacer(width: 6),
                        Text('May 10, 2020',
                            style: FONT_CONST.REGULAR_GRAY1_50_9),
                      ],
                    ),
                    Text(
                        'Creating an erotic melodrama movie is an extremely delicate matter.',
                        style: FONT_CONST.REGULAR_GRAY4_10)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}
