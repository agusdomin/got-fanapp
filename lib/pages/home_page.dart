import 'dart:html';
import 'package:flutter/material.dart';
import 'package:got_fanapp/widgets/personaje_fav_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // Personajes y casas
            Row(
              children: [Text("Personajes"), Text("Casas")],
            ),
            ListView.builder(
              //itemCount: ,

              itemBuilder: (BuildContext context, index) {
                return Container(
                  height: 500,
                  width: 400,
                  child: PersonajeFavCard(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
