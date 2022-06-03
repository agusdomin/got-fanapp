import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:got_fanapp/models/personaje.dart';
import 'package:got_fanapp/pages/casas_fav_page.dart';
import 'package:got_fanapp/pages/personajes_fav_page.dart';
import 'package:got_fanapp/pages/personajes_page.dart';
import 'package:got_fanapp/routes.dart';
import 'package:got_fanapp/widgets/add_personaje_fav_card%20copy.dart';
import 'package:got_fanapp/widgets/custom_indicador_tabbar.dart';
import 'package:got_fanapp/widgets/personaje_fav_card.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<Personaje> personajes = [];

  Future<List<Personaje>> _getDataFuture() async {
    // return http
    //     .get(Uri.parse("https://thronesapi.com/api/v2/Characters"))
    //     .then((response) {
    //   return personajesFromJson(response.body);
    //});
    final jsonData = await rootBundle.loadString('jsonFiles/personajes.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Personaje.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            bottom: TabBar(
                labelPadding: EdgeInsetsDirectional.only(bottom: 10),
                labelColor: Colors.black,
                indicator: CustomIndicadorTabbar(color: Colors.blue, radius: 8),
                indicatorColor: Colors.black,
                // indicator: DecoratedBox(decoration: BoxDecoration(borderRadius: Radius.circular(10))),
                indicatorWeight: 10.0,
                tabs: [
                  Tab(
                    child: GestureDetector(
                      child: Text(
                        "Personajes",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Tab(
                      child: GestureDetector(
                    child: Text("Casas",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ))
                ]),
          ),
          body: TabBarView(children: [PersonajesFavPage(), CasasFavPage()])),
    );
  }
}
