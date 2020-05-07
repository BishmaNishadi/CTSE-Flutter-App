import 'dart:async';
import 'dart:io' as io;
import 'package:find_seat/model/Review.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper{

  //Define database
  final String TABLE_NAME = "Review";

  static Database db_instance;

  Future<Database> get db async{
    if(db_instance == null)
      db_instance = await initDB();
    return db_instance;
  }

  initDB() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "EDMTDev.db");
    var db = await openDatabase(path,version: 1, onCreate: onCreateFunc);
    return db;
  }

  void onCreateFunc(Database db, int version) async {
    //create table
    await db.execute('CREATE TABLE $TABLE_NAME(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, description TEXT);');
  }

  //  CRUD Functions

  //Get Reviews
  Future<List<Review>> getReviews() async{
    var db_connection = await db;
    List<Map> list = await db_connection.rawQuery('SELECT * FROM $TABLE_NAME');
    List<Review> reviews = new List();
    for(int i = 0; i < list.length; i++){
      Review review = new Review();
      review.id = list[i]['id'];
      review.name = list[i]['name'];
      review.description = list[i]['description'];

      reviews.add(review);
    }
    return reviews;
  }

  //Add new review
  void addNewReview(Review review) async{
    var db_connection = await db;
//    review.name = 'kasun';
//    review.description = 'des';
    String query = 'INSERT INTO $TABLE_NAME(name,description) VALUES (\'${review.name}\',\'${review.description}\')';
    await db_connection.transaction((transaction) async{
      return await transaction.rawInsert(query);
    });
  }

  //Update review
  void updateReview(Review review) async{
    var db_connection = await db;
    String query = 'UPDATE $TABLE_NAME SET name=\'${review.name}\' ,description=\'${review.description}\' WHERE id=${review.id}';
    await db_connection.transaction((transaction) async{
      return await transaction.rawQuery(query);
    });
  }

  //Delete review
  void deleteReview(Review review) async{
    var db_connection = await db;
    String query = 'DELETE FROM $TABLE_NAME WHERE id=${review.id}';
    await db_connection.transaction((transaction) async{
      return await transaction.rawQuery(query);
    });
  }


}