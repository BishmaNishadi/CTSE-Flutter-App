import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetShowCasts extends StatelessWidget {
  List<ModelCast> model = [
    ModelCast('Uddhika', 'images/casts/81202d0dea55189fa442a1ab932a81a7.png'),
    ModelCast(
        'Iresha', 'images/casts/646262125800725e14d8c4ff4b2a2181.png'),
    ModelCast('Saranga', 'images/casts/a053e9fb0c813cd15b34a2edff71ae9d.png'),
    ModelCast(
        'Lucky Dias', 'images/casts/289bf4c714c627dc42b17199024a152d.png'),
    ModelCast(
        'Sanath', 'images/casts/289bf4c714c627dc42b17199024a152d.png'),
    ModelCast(
        'Janith', 'images/casts/289bf4c714c627dc42b17199024a152d.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204,
      color: COLOR_CONST.WHITE,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text('Casts',
                      style: FONT_CONST.MEDIUM_BLACK2_14)),
              Expanded(
                  child: Text('Slide to view >',
                      style: FONT_CONST.REGULAR_DEFAULT_10,
                      textAlign: TextAlign.right)),
            ],
          ),
          WidgetSpacer(height: 14),
          Container(
            height: 130,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return WidgetSpacer(width: 14);
              },
              itemBuilder: (context, index) {
                var item = model[index];
                return _WidgetItemCast(item);
              },
              itemCount: model.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _WidgetItemCast extends StatelessWidget {
  ModelCast model;

  _WidgetItemCast(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 130,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              model.photo,
              fit: BoxFit.cover,
              width: 85,
              height: 107,
            ),
          ),
          WidgetSpacer(height: 5),
          Text(
            model.name,
            style: FONT_CONST.REGULAR_GRAY4_12,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class ModelCast {
  String name;
  String photo;

  ModelCast(this.name, this.photo);
}
