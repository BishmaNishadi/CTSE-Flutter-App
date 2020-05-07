import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/show_info/showInfoScreen.dart';
//import 'package:find_seat/presentation/screen/show_info/sc_show_info.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetListShow extends StatelessWidget {
  List<ItemShowVM> items;

  WidgetListShow(this.items);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 10,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shrinkWrap: true,
      childAspectRatio: 150 / 250,
      physics: BouncingScrollPhysics(),
      children: items.map(
        (item) {
          return _WidgetItemShow(item);
        },
      ).toList(),
    );
  }
}

class _WidgetItemShow extends StatelessWidget {
  ItemShowVM item;

  _WidgetItemShow(this.item);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return GestureDetector(
      onTap: () {
       // openShowDetails();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context){
              return ShowInfoScreen();
            }
            )
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item.photo,
              fit: BoxFit.contain,
            ),
          ),
          WidgetSpacer(height: 6),
          Text(item.title, style: FONT_CONST.REGULAR_BLACK2_14),
          WidgetSpacer(height: 2),
        ],
      ),
    );
  }

 // void openShowDetails() {
    //Navigator.pushNamed(_context, Router.SHOW_INFO);
 // }
}

class ItemShowVM {
  String photo;
  String title;

  ItemShowVM(this.photo, this.title);
}
