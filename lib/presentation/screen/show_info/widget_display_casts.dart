import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetShowCasts extends StatelessWidget {
  List<ModelCast> model = [
    ModelCast('Uddhika', 'images/casts/uddika.jpg'),
    ModelCast(
        'Iresha', 'images/casts/iresha.jpg'),
    ModelCast('Saranga', 'images/casts/saranga.jpg'),
    ModelCast(
        'Lucky Dias', 'images/casts/lucky-dias.jpg'),
    ModelCast(
        'Sanath', 'images/casts/sanath.jpg'),
    ModelCast(
        'Janith', 'images/casts/janith.jpg'),
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
