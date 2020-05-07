

import 'package:find_seat/Database/DBHelper.dart';
import 'package:find_seat/model/Review.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/screen/show_info/review_list.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'add_review.dart';

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
//      body: new Padding(padding: const EdgeInsets.all(16.0),
//        child: new Form(
//         key: formKey,
//          child: new Column(
//            children: <Widget>[
//              TextFormField(
//                keyboardType: TextInputType.text,
//                decoration: new InputDecoration(labelText: "Name"),
//                validator: (val)=> val.length == 0 ? "Enter your name": null,
//                onSaved: (val) => this.name = val,
//              ),
//              TextFormField(
//                keyboardType: TextInputType.text,
//                decoration: new InputDecoration(labelText: "Review"),
//                validator: (val)=> val.length == 0 ? "Write your review": null,
//                onSaved: (val) => this.description = val,
//              ),
//              new Container(
//                margin: const EdgeInsets.only(top:10.0),
//                child: new RaisedButton(
//                  onPressed: submitReview,
//                  child: Text ('Add a review'),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
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
//    formKey.currentState.save();
//    if(this.formKey.currentState.validate()){
//      formKey.currentState.save();
//    }else{
//      return null;
//    }
    var review = Review();
//    review.name = 'Kasun';
//    review.description = 'Dummy';

    var dbHelper = DBHelper();
    dbHelper.addNewReview(review);
    Fluttertoast.showToast(msg: 'Review was added',toastLength: Toast.LENGTH_SHORT, webBgColor: '#FFFFFF');
  }

  /*Widget build(BuildContext context) {
    return Container(
      height: 124,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(color: COLOR_CONST.WHITE),
      child: Column(
        children: <Widget>[
          WidgetSpacer(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  'images/casts/reviewer.jpg',
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
                        Text('Ravindu Bandara', style: FONT_CONST.MEDIUM_GRAY4_10),
                        WidgetSpacer(width: 6),
                        Text('May 10, 2020',
                            style: FONT_CONST.REGULAR_GRAY1_50_9),
                      ],
                    ),
                    Text(
                        'Creating an erotic melodrama movie is an extremely delicate matter.',
                        style: FONT_CONST.REGULAR_GRAY4_10)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }*/

}
