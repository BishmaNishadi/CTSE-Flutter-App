import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetDisplayReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(color: COLOR_CONST.WHITE),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                'Reviews',
                style: FONT_CONST.MEDIUM_BLACK2_14,
              )),
            ],
          ),
          WidgetSpacer(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  'images/sample_reviewer.png',
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
                        Text('Kasun Atulugama', style: FONT_CONST.MEDIUM_GRAY4_10),
                        WidgetSpacer(width: 6),
                        Text('May 7, 2020',
                            style: FONT_CONST.REGULAR_GRAY1_50_9),
                      ],
                    ),
                    Text(
                        'There is a saying that lightning never strikes the same place twice.',
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
