import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:got_fanapp/services/models/personaje.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await initDB('got_database.db');
    return _database!;
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db /* db es el path */, int version) async {
    final id = 'INTEGER PRIMARY KEY';
    return db.execute(
      '''CREATE TABLE favoritos($id)''',
    );
  }

  Future<void> insertFav(Personaje personaje) async {
    final db = await instance.database;
    await db.insert('favoritos', personaje.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future getAllFavs() async {
    final db = await instance.database;
    final List<Map> allFavs = await db.query('favorito');
    return allFavs;
  }
}

    // FORMA COMPRIMIDA DE LA OBTENCION E INICIACION DE LA DB 
    //return openDatabase(
    //   join(await getDatabasesPath(), 'got_database.db'),
    //   onCreate: (db, version) {
    //     return db.execute(
    //       'CREATE TABLE favoritos(id INTEGER PRIMARY KEY)',
    //     );
    //   },
    //   version: 1,
    // );