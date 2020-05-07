import 'package:find_seat/presentation/MainWidgetsCollection/widget_spacer.dart';
import 'package:find_seat/presentation/custom_ui/svg_image.dart';
import 'package:find_seat/presentation/screen/all_movies/allMoviesScreen.dart';
//import 'package:find_seat/presentation/screen/all_shows/sc_all_shows.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class MovieIcons extends StatelessWidget {
  //categorizing the movies into sub parts by a list view by calling the _IconViewList
  List<_IconViewList> items = [

    _IconViewList("Thriller", "assets/movie_icon.svg"),
    _IconViewList("Romantic", "assets/movie_icon.svg"),
    _IconViewList("Action", "assets/movie_icon.svg"),
    _IconViewList("Comedy", "assets/movie_icon.svg"),
    _IconViewList("Horror", "assets/movie_icon.svg"),
    _IconViewList("Real life", "assets/movie_icon.svg"),
  ];


  _showList() {
    return Container(
      height: 58,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = items[index];

            return _IconsView(item);
          },
          separatorBuilder: (context, index) {
            return WidgetSpacer(width: 30);
          },
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('MOVIE CATEGORIES',
              style: FONT_CONST.MEDIUM_BLACK2_14),
          WidgetSpacer(height: 14),
          _showList(),
        ],
      ),
    );
  }
}

class _IconsView extends StatelessWidget {
  _IconViewList item;

  _IconsView(this.item);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return GestureDetector(
      //Navigate into the all shows screen
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context){
              return AllShowsScreen();
            }
            )
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 34,
            height: 34,
            child: Center(
              child: MySvgImage(
                path: item.image,
                width: 28,
                height: 28,
                applyColorFilter: false,
              ),
            ),
          ),
          WidgetSpacer(height: 4),
          Text(item.icon_name, style: FONT_CONST.REGULAR_GRAY6_12),
        ],
      ),
    );
  }


  //void openAllShows() {
   // Navigator.pushNamed(_context, Router.ALL_MOVIES);
  //}

}

class _IconViewList {
  String image;
  String icon_name;

  _IconViewList(this.icon_name, this.image);
}
