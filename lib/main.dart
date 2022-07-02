import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/cubit/personajes_cubit.dart';
import 'package:got_fanapp/database.dart';
import 'package:got_fanapp/routes.dart';
import 'package:got_fanapp/services/personajes_services.dart';

import 'package:got_fanapp/services/models/personaje.dart';
// Base de datos
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  //

  runApp(
    BlocProvider(
      create: (_) =>
          PersonajesCubit(PersonajeService(), DatabaseHelper.instance),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoT Fan App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: routes,
      initialRoute: Routes.home,
    );
  }
}
