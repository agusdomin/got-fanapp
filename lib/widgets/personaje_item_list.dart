import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:got_fanapp/pages/personajes_fav_page.dart';
import 'package:got_fanapp/pages/info_page.dart';
import 'package:got_fanapp/routes.dart';
import 'package:got_fanapp/services/models/personaje.dart';

import '../cubit/personajes_cubit.dart';
import '../cubit/personajes_state.dart';

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
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Image(
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      image: NetworkImage(personaje.imageUrl),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 40)),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(personaje.fullName,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Text(personaje.family),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: BlocBuilder<PersonajesCubit, PersonajesState>(
                          builder: ((context, state) {
                        final personajesCubit = context.read<PersonajesCubit>();

                        return IconButton(
                          icon: personajesCubit.isFav(personaje)
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite_outline),
                          onPressed: () {
                            personajesCubit.toggleFav(personaje);
                          },
                        );
                      })),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
