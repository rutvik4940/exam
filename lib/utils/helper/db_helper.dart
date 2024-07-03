import 'dart:io';

import 'package:exam/screen/model/db_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static DbHelper helper = DbHelper._();

  DbHelper._();

  Database? database;

  Future<Database>? checkdb() async {
    if (database != null) {
      return database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory dir = await getApplicationSupportDirectory();
    String path = join(dir.path, "rutvik.dp");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String productQuery =
            "CREATE TABLE product (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,date TEXT,time TEXT,price TEXT,rate TEXT)";
        db.execute(productQuery);
      },
    );
  }

  Future<void> insertProduct(DbModel model) async {
    database = await checkdb();
    database!.insert(
      "product",
      {
        "category":model.category,
        "price": model.price,
        "rate": model.rate,
        "date": model.date,
        "time": model.time
      },
    );
  }
  Future<List<DbModel>> readProduct()
  async {
    database=await checkdb();

    String produts= "SELECT * FROM product";
    List<Map>list= await database!.rawQuery(produts);
    List<DbModel> l1=list.map((e) => DbModel.mapToModel(e)).toList();
    return l1;
  }
  Future<void> deletProduct(int id)
  async {
    database=await checkdb();
    database!.delete("product",where: "id=?",whereArgs: [id]);
  }
}
