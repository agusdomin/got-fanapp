import 'package:flutter/material.dart';

import 'package:got_fanapp/pages/personajes_fav_page.dart';
import 'package:got_fanapp/pages/info_page.dart';
import 'package:got_fanapp/routes.dart';
import 'package:got_fanapp/services/models/personaje.dart';

class PersonajeItemList extends StatelessWidget {
  Personaje personaje;
  PersonajeItemList({required this.personaje, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, Routes.info,
            arguments: InfoPageArguments(personaje))
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
              tag: personaje,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Image(
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      image: NetworkImage(personaje.imageUrl),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 40)),
                    Column(
                      children: [
                        Text(personaje.fullName,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Text(personaje.family),
                      ],
                    ),
                  ],
                ),
              )),
          Expanded(child: Icon(Icons.favorite)),
        ],
      ),
    );
  }
}
