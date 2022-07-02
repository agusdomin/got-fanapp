import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/cubit/personajes_cubit.dart';
import 'package:got_fanapp/cubit/personajes_state.dart';
import 'package:got_fanapp/services/models/personaje.dart';

import 'package:got_fanapp/widgets/personaje_item_list.dart';

class PersonajesSearcher extends StatelessWidget {
  List<Personaje> personajes;
  PersonajesSearcher({required this.personajes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personajesCubit = context.read<PersonajesCubit>();
    return (Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: 300,
            child: TextField(
              onChanged: (value) => personajesCubit.search(value),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: "Nombre del personaje",
                  border: OutlineInputBorder()),
            )),
        Padding(padding: EdgeInsetsDirectional.all(20)),
        BlocBuilder<PersonajesCubit, PersonajesState>(
          builder: (context, state) {
            return (Container(
              height: MediaQuery.of(context).size.height - 188,
              child: ListView.builder(
                  itemCount: state.countFiltrados,
                  itemBuilder: (BuildContext context, int index) {
                    Personaje? personaje = state.personajesFiltrados[index];
                    return PersonajeItemList(personaje: personaje);
                  }),
            ));
          },
        ),
      ],
    ));
  }
}
