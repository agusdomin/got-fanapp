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

// Creacion de un servicio que se encarga de la consulta a la API

// Crear de cubit, que extiende de cubir declarando el tipo de estado
//Cambio de estado con las subclases creadas que heredan y definen el estado general.

// Cuando necesito que un widget conozca y maneje el estado, este tendra un BlocBuilder, que definira el
// cubit y el estado que maneja.
// usa un builder que tiene el contexto y el estado, asi puedo acceder a los distintos estados y realizar lo que quiera.

//El tipo de estado herada de equatable
// defino los parametros que van a detemerminar mi estado y a los que voy a escuchar para saber si hubo cambio de estado\
// creo distintos estados para diferenciar
