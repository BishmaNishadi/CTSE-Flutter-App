
import 'package:find_seat/Database/DBHelper.dart';
import 'package:find_seat/model/Review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<List<Review>> getReviewsFormDB() async{
  var dbHelper = DBHelper();
  Future<List<Review>> reviews = dbHelper.getReviews();
  return reviews;
}

class MyReviewList extends StatefulWidget{



  @override
  State<StatefulWidget> createState() => new MyReviewListState();

}

class MyReviewListState  extends State<MyReviewList>{


    //Create controller for update name, description
    final controller_name = new TextEditingController();
    final controller_description = new TextEditingController();

    @override
    Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
    ),
    body: new Container(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder<List<Review>>(
        future: getReviewsFormDB(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index) {
                  return new Row(
                    children: <Widget>[
                      Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
//                            'Kasun',
                            snapshot.data[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),

                        Text(
//                          'Lorem Ipsum',
                        snapshot.data[index].description,
                        style: TextStyle(
                            color: Colors.grey[500]
                          ),
                        ),

                      ],),
                      ),

                      //Create Update Delete btn
                      GestureDetector(
                        onTap: () {
                          //show text to enter value
                          showDialog(context: context, builder: (_)=> new AlertDialog(contentPadding: const EdgeInsets.all(16.0),
                          content: new Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextFormField(
                                      autofocus: true,
                                      decoration: InputDecoration(hintText: '${snapshot.data[index].name}'),
                                      controller: controller_name,
                                    ),
                                    TextFormField(
                                      autofocus: true,
                                      decoration: InputDecoration(hintText: '${snapshot.data[index].description}'),
                                      controller: controller_description,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                            actions: <Widget>[
                              new FlatButton(onPressed: () {
                                Navigator.pop(context);
                          }, child: Text('CANCEL')),
                              new FlatButton(onPressed: () {
                                var dbHelper = new DBHelper();
                                Review review = new Review();
                                review.id = snapshot.data[index].id;
                                //keep old value if text field name is empty
                                review.name = controller_name != ''?controller_name.text:snapshot.data[index].name;
                                review.description = controller_description != ''?controller_description.text:snapshot.data[index].description;

                                //update
                                dbHelper.updateReview(review);
                                Navigator.pop(context);
                                setState(() {
                                  getReviewsFormDB(); //refresh data
                                });

                                Fluttertoast.showToast(msg: 'Review is updated', toastLength: Toast.LENGTH_SHORT, webBgColor: 'FFFFFF');

                              }, child: Text('UPDATE'))
                            ],
                          ));
                        },
                        child: Icon(
                          Icons.update,
                          color: Colors.blueAccent,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {

                          var dbHelper = new DBHelper();
                          dbHelper.deleteReview(snapshot.data[index]);
                          Fluttertoast.showToast(msg: 'Review is deleted', toastLength: Toast.LENGTH_SHORT, webBgColor: 'FFFFFF');

                          //refresh data
                          setState(() {
                            getReviewsFormDB();
                          });

                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                      new Divider(),
                    ],
                  );
                });
              }
            else if(snapshot.data.length == 0)
              return Text('No Data Found');
          }

          //Show loading while snapshot is not fetching data
          return new Container(
          alignment: AlignmentDirectional.center,
          child: new CircularProgressIndicator(),
          );
    },

    ),
    ),
    );
  }

  @override
  void initState() {
    super.initState();
  }


}