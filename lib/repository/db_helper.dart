import 'package:sqflite/sqflite.dart';
import 'dart:async';
//mendukug pemrograman asinkron
import 'dart:io';
//bekerja pada file dan directory
import 'package:path_provider/path_provider.dart';
import 'package:uang_saku/model/notifikasi.dart';
//pubspec.yml


//kelass Dbhelper
class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;  

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
  
  //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notifikasi.db';
    
   //create, read databases
    var notifDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return notifDatabase;
  }

	//buat tabel baru dengan nama contact
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notifikasi (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        message TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('notifikasi', orderBy: 'id');
    return mapList;
  }

//create databases
  Future<int> insert(Notifikasi object) async {
    Database db = await this.database;
    int count = await db.insert('notifikasi', object.toMap());
    return count;
  }
//update databases
  Future<int> update(Notifikasi object) async {
    Database db = await this.database;
    int count = await db.update('notifikasi', object.toMap(), 
                                where: 'id=?',
                                whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('notifikasi', 
                                where: 'id=?', 
                                whereArgs: [id]);
    return count;
  }

  Future<int> drop() async {
    Database db = await this.database;
    int count = await db.delete('notifikasi');
    return count;
  }
  
  Future<List<Notifikasi>> getContactList() async {
    var notifikasiMapList = await select();
    int count = notifikasiMapList.length;
    List<Notifikasi> notifikasiList = [];
    for (int i=0; i<count; i++) {
      notifikasiList.add(Notifikasi.fromMap(notifikasiMapList[i]));
    }
    return notifikasiList;
  }

}