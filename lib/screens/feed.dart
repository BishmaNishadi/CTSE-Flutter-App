


import 'package:find_seat/api/food_api.dart';
import 'package:find_seat/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  const Feed({Key key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    //FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    //Future<void> _refreshList() async {
     // getFoods(foodNotifier);
   // }

    print("building Feed");
    return Scaffold(
        appBar: AppBar(
        title: Text(
        authNotifier.user != null ? authNotifier.user.displayName : "Feed",
    ),
    actions: <Widget>[
    // action button
    FlatButton(
    onPressed: () => signout(authNotifier),
    child: Text(
    "Logout",
    style: TextStyle(fontSize: 20, color: Colors.white),
    ),
    ),
    ],
        )
    );

    }
}