import 'package:find_seat/presentation/MainWidgetsCollection/MainWidgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetShowDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.WHITE,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: _buildMovieName_info(),
              ),
            ],
          ),
          WidgetSpacer(height: 12),
          _createTags(),
          WidgetSpacer(height: 10),
          _createAdditinalInfo(),
        ],
      ),
    );
  }

  _buildMovieName_info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('RUSH - A STORY WITH LOVE', style: FONT_CONST.MEDIUM_BLACK2_16),
        WidgetSpacer(height: 6),
        Text('Release | May 15, 2020', style: FONT_CONST.REGULAR_GRAY4_12)
      ],
    );
  }

  _createTags() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Sinhala', style: FONT_CONST.REGULAR_DEFAULT_12),
        WidgetSpacer(width: 10),
        _bldTag('3D'),
        WidgetSpacer(width: 6),
        _bldTag('Action'),
        WidgetSpacer(width: 6),
        _bldTag('Romance'),
      ],
    );
  }

  _bldTag(String tag) {
    return Container(
      child: Center(child: Text(tag, style: FONT_CONST.REGULAR_DEFAULT_12)),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
          color: COLOR_CONST.TAGMOV_BG,
          borderRadius: BorderRadius.circular(4),
          shape: BoxShape.rectangle),
    );
  }

  _createAdditinalInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MySvgImage(
          width: 10,
          height: 10,
          color: COLOR_CONST.GRAY1,
          path: 'assets/clock_ic.svg',
        ),
        WidgetSpacer(width: 7),
        Text('3h 15m', style: FONT_CONST.REGULAR_GRAY1_10),
        WidgetSpacer(width: 10),
      ],
    );
  }
}
