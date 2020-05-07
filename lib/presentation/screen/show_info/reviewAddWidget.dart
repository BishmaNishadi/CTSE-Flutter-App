

import 'package:find_seat/Database/DBHelper.dart';
import 'package:find_seat/model/Review.dart';
import 'package:find_seat/presentation/MainWidgetsCollection/MainWidgets.dart';
import 'package:find_seat/presentation/screen/show_info/reviewList.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'addReview.dart';

class WidgetDisplayReview2 extends StatelessWidget {

  Review review = new Review();

  String name, description;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

//  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
          IconButton(
            icon: const Icon(Icons.rate_review),
            tooltip: 'View Reviews',
            onPressed: (){
              addReviewList(context);
            },
          ),
              Text(
                'Write a review'
              ),
          ]
          ),
//        ],
          Row(
              children: <Widget>[

              ]
          ),
        ],
    ),
  );
  }

  void startReviewList(context) {
    //navigate new screen for contacts
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyReviewList()));
  }

  void addReviewList(context) {
    //navigate new screen for contacts
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new AddReview()));
  }

  void submitReview() {
    var review = Review();

    var dbHelper = DBHelper();
    dbHelper.addNewReview(review);
    Fluttertoast.showToast(msg: 'Review was added',toastLength: Toast.LENGTH_SHORT, webBgColor: '#FFFFFF');
  }

}
