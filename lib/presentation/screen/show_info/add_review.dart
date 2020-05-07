

import 'package:find_seat/Database/DBHelper.dart';
import 'package:find_seat/model/Review.dart';
import 'package:find_seat/presentation/screen/home/Movie_Home.dart';
import 'package:find_seat/presentation/screen/show_info/review_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddReview extends StatelessWidget{

  Review review = new Review();

  String name, description;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: Text('Write a Review'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.view_list),
            tooltip: 'View List',
            onPressed: (){
              startReviewList(context);
            },
          )
        ],
      ),
      body: new Padding(padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: "Name"),
                validator: (val)=> val.length == 0 ? "Enter your name":null,
                onSaved: (val) => this.name = val,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: "Description"),
                validator: (val)=> val.length == 0 ? "Enter your description":null,
                onSaved: (val) => this.description = val,
              ),
              new Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(onPressed: submitReview, child: Text('ADD NEW REVIEW'),),
              )
            ],
          ),
        ),
      ),
    );
  }

  void startReviewList(context) {
    //navigate new screen for contacts
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyReviewList()));
  }

  void submitReview() {
    formKey.currentState.save();
    if(this.formKey.currentState.validate()){
      formKey.currentState.save();
    }else{
      return null;
    }
    var review = Review();
    review.name = name;
    review.description = description;

    var dbHelper = DBHelper();
    dbHelper.addNewReview(review);
    Fluttertoast.showToast(msg: 'Review was added',toastLength: Toast.LENGTH_SHORT, webBgColor: '#FFFFFF');
  }

}