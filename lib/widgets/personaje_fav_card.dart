import 'package:flutter/material.dart';

import 'package:got_fanapp/pages/personajes_fav_page.dart';
import 'package:got_fanapp/pages/info_page.dart';
import 'package:got_fanapp/routes.dart';
import 'package:got_fanapp/services/models/personaje.dart';

class PersonajeFavCard extends StatelessWidget {
  Personaje personaje;
  PersonajeFavCard({required this.personaje, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, Routes.info,
            arguments: InfoPageArguments(personaje))
      },
      child: Hero(
        tag: personaje,
        child: Column(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
                image: new DecorationImage(
                  image: NetworkImage(personaje.imageUrl),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text(personaje.fullName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(personaje.family),
          ],
        ),
      ),
    );
  }
}
