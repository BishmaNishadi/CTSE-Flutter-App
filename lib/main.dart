import 'package:find_seat/app_config.dart';
import 'package:find_seat/presentation/screen/home/Movie_Home.dart';
//import 'package:find_seat/presentation/screen/login/home.dart';
import 'package:find_seat/presentation/screen/login/widget_login_form.dart';
//import 'package:find_seat/screens/feed.dart';
//import 'package:find_seat/screens/login.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:find_seat/presentation/screen/login/sc_login.dart';
import 'package:provider/provider.dart';


import 'notifier/auth_notifier.dart';
import 'presentation/router.dart';
/*main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var initialRoute = AppConfig.of(context).initialRoute;

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: COLOR_CONST.DEFAULT,
        accentColor: COLOR_CONST.DEFAULT,
        hoverColor: COLOR_CONST.GREEN,
        fontFamily: 'Poppins',
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: initialRoute,
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: COLOR_CONST.STATUS_BAR,
      ),
    );
  }
}*/

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => AuthNotifier(),
    ),
   // ChangeNotifierProvider(
      //create: (context) => FoodNotifier(),
   // ),
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var initialRoute = AppConfig.of(context).initialRoute;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coding with Curry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
      ),
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? Home() : Login();
        },
      ),

    );

  }

}
