import 'package:flutter/material.dart';
import 'package:got_fanapp/models/personaje.dart';

import 'package:got_fanapp/routes.dart';

class AddPersonajeFavCard extends StatelessWidget {
  AddPersonajeFavCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, Routes.home)},
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 200,
            child: Column(
              children: [
                Text("Aniadir pesonaje"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
