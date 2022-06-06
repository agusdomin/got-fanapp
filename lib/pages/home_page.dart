import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:got_fanapp/pages/casas_fav_page.dart';
import 'package:got_fanapp/pages/personajes_fav_page.dart';
import 'package:got_fanapp/widgets/custom_indicador_tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
