import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/services/models/personaje.dart';

import 'package:got_fanapp/widgets/add_personaje_fav_card.dart';
import 'package:got_fanapp/widgets/personaje_fav_card.dart';

class PersonajesFavPageView extends StatelessWidget {
  List<Personaje> personajes;
  PersonajesFavPageView({required this.personajes, Key? key});

  @override
  Widget build(BuildContext context) {
    int lastIndex = (personajes.length) + 1;
    return Container(
        margin: EdgeInsetsDirectional.all(50.0),
        height: 800,
        width: 400,
        child: PageView.builder(
          pageSnapping: true,
          itemCount: lastIndex,
          itemBuilder: (BuildContext context, int index) {
            if (index < lastIndex - 1) {
              Personaje? personaje = personajes[index];
              return PersonajeFavCard(
                personaje: personaje,
              );
            } else {
              return AddPersonajeFavCard();
            }
          },
        ));
  }
  //return const CircularProgressIndicator();
}
