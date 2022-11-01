

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

import 'User_Model.dart';

class DataBaseHelper{

   static String DB_Name ="UserSignupInfo";
   static String tableName = "user";
   static int version =1;
   static  late Database _db;
   static String userName ='userName';
   static String userEmail ='userEmail';
   static String userPass1 ='userPass1';
   static String userPass2 ='userPass2';

   Future<Database> get db async{
     // print("db te dhuklam");
     //
     // print("db ready hochhe");
     _db= await initDB();
     if(_db != null){
       //print("db null");
       return _db;
     }

     return  _db;
   }

   initDB() async{
     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
     String path = join(documentsDirectory.path,DB_Name );
     var db =await openDatabase(path ,version: version, onCreate: _onCreate );
     return db;
   }
   _onCreate(Database db, int intVersion) async{
      await db.execute("CREATE TABLE $tableName("
          "$userEmail TEXT PRIMARY KEY ,"
          "$userName TEXT, "
          "$userPass1 TEXT "

          ")");
   }

   Future<int> saveData(UserModel user) async{
      print('res1');
      var dbClient = await db;
      print('res2');
        print(dbClient);
      var res= (await dbClient.insert(tableName, user.tomap()));
      print('res3');
      return res;
   }
   Future<UserModel?> getLoginUser( String Email, String  Pass) async{// return type nullable o hote pare tai question mark
      var dbClient = await db;
      var res = await dbClient.rawQuery("SELECT * FROM $tableName WHERE "
          "$userEmail = '$Email' AND "
          "$userPass1 = '$Pass' "
      );
      if(res.length > 0){
        return UserModel.fromMap(res.first);

      }
      return null ;
   }

}
