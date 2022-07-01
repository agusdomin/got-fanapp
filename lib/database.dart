import 'dart:async';

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

    return await openDatabase(path, version: 5, onCreate: _createDB);
  }

  Future _createDB(Database db /* db es el path */, int version) async {
    final idType = "INTEGER PRIMARY KEY ";

    return db.execute(
      "CREATE TABLE favoritos(id $idType,firstName TEXT,lastName TEXT,fullName TEXT,title TEXT,family TEXT,image TEXT,imageUrl TEXT)",
    );
  }

  Future<void> insertFav(Personaje personaje) async {
    final db = await instance.database;
    await db.insert('favoritos', personaje.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteFav(int id) async {
    final db = await instance.database;
    // Eliminar de base de datos

    await db.delete('favoritos', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Personaje>> getAllFavs() async {
    final db = await instance.database;
    final List<Map> maps = await db.query('favoritos');
    if (maps.isNotEmpty) {
      return List.generate(maps.length, (i) {
        return Personaje(
          id: maps[i]['id'],
          firstName: maps[i]['firstName'],
          lastName: maps[i]['lastName'],
          fullName: maps[i]['fullName'],
          title: maps[i]['title'],
          family: maps[i]['family'],
          image: maps[i]['image'],
          imageUrl: maps[i]['imageUrl'],
        );
      });
    } else {
      print("No hay personajes favoritos");
      return [];
    }
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