import 'package:find_seat/presentation/screen/all_movies/barrelAllShows.dart';
import 'package:find_seat/presentation/screen/booking/cinema_hall_booking/availableCinemaHallScreen.dart';
import 'package:find_seat/presentation/screen/list_all_cine/barrel_list_all_cine.dart';
//import 'package:find_seat/presentation/screen/login/sc_login.dart';
import 'package:find_seat/presentation/screen/show_info/barrelInfoShow.dart';
import 'package:flutter/material.dart';

import 'screen/home/Movie_Home.dart';
import 'screen/splash/sc_splash.dart';

class Router {
  static const String HOME = '/';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String ALL_MOVIES = '/all_shows';
  static const String SHOW_INFO = '/show_info';
  static const String BOOK_TIME_SLOT = '/book_time_slot';
  static const String BOOK_SEAT_TYPE = '/book_seat_type';
  static const String BOOK_SEAT_SLOT = '/book_seat_slot';
  static const String LIST_ALL_CINE = '/list_all_cine';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => Home());
      //case SPLASH:
        //return MaterialPageRoute(builder: (_) => SplashScreen());
      //case LOGIN:
       // return MaterialPageRoute(builder: (_) => LoginScreen());
      case ALL_MOVIES:
        return MaterialPageRoute(builder: (_) => AllShowsScreen());
      case BOOK_TIME_SLOT:
        return MaterialPageRoute(builder: (_) => BookTimeSlotScreen());
      case SHOW_INFO:
        return MaterialPageRoute(builder: (_) => ShowInfoScreen());
      case LIST_ALL_CINE:
        return MaterialPageRoute(builder: (_) => ListAllCineScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
