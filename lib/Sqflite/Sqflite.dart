
import 'dart:core';
import 'dart:io';
import 'package:sqflite/sqflite.dart';

class SqlDb {

  static Database? _db ; 
  
  Future<Database?> get db async {
      if (_db == null){
        _db  = await intialDb() ;
        return _db ;  
      }else {
        return _db ; 
      }
  }


intialDb() async {
  String databasepath = await getDatabasesPath() ; 
  String path =  databasepath+'/'+'abd.db';
  // join(databasepath , 'wael.db') ;   
  Database mydb = await openDatabase(path , onCreate: _onCreate , version: 3  , onUpgrade:_onUpgrade ) ;  
  return mydb ; 
}

_onUpgrade(Database db , int oldversion , int newversion ) {


 print("onUpgrade =====================================") ; 
  
}

_onCreate(Database db , int version) async {
  await db.execute('''
  CREATE TABLE 'works' (
    'dno' INTEGER  NOT NULL,
    'pname' TEXT NOT NULL,
    'image1' BLOB NOT NULL,
    'image2' BLOB ,
    'image3' BLOB ,
    'image4' BLOB ,
  )
 ''') ;
 print(" onCreate =====================================") ; 
}

// readData(String sql) async {
//   Database? mydb = await db ; 
//   List<Map> response = await  mydb!.rawQuery(sql);
//   return response ; 
// }
// insertData(String sql) async {
//   Database? mydb = await db ; 
//   int  response = await  mydb!.rawInsert(sql);
//   return response ; 
// }
// updateData(String sql) async {
//   Database? mydb = await db ; 
//   int  response = await  mydb!.rawUpdate(sql);
//   return response ; 
// }
// deleteData(String sql) async {
//   Database? mydb = await db ; 
//   int  response = await  mydb!.rawDelete(sql);
//   return response ; 
// }
// void savePicture(Picture picture) async {
//   var dbClient = await db;
//   await dbClient?.insert("Picture", picture.toMap());
// }
 Future<int> insertImage(int number, File imageFile1,File imageFile2,File imageFile3,File imageFile4) async {
    final db = await _db;
    final imageBytes1 = await imageFile1.readAsBytes();
    final imageBytes2 = await imageFile2.readAsBytes();
    final imageBytes3 = await imageFile3.readAsBytes();
    final imageBytes4 = await imageFile4.readAsBytes();
    return await db!.insert('works', {
      'dno': number,
      'image1': imageBytes1,
      'image2': imageBytes2,
      'image3': imageBytes3,
      'image4': imageBytes4,
    });
  }

  Future<List<Map<String, dynamic>>> getImages(int id)  async {
    final db = await _db;
    return  db!.query('images',where: '$id');
  }
   Future<List<Map<String, dynamic>>> getImages2(String nam)  async {
    final db = await _db;
    return  db!.query('images',where: nam);
  }
}