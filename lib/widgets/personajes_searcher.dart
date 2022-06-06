import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/cubit/personajes_cubit.dart';
import 'package:got_fanapp/models/personaje.dart';
import 'package:got_fanapp/widgets/personaje_item_list.dart';

class PersonajesSearcher extends StatelessWidget {
  List<Personaje> personajes;
  PersonajesSearcher({required this.personajes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          child: BlocBuilder(
            builder: ((context, state) {
              final characterCubit = context.read<PersonajesCubit>();
              return (TextField(
                onChanged: (value) => characterCubit.search(value),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Nombre del personaje",
                    border: OutlineInputBorder()),
              ));
            }),
            // child: TextField(
            //   onChanged: (value) => characterCubit.search(value),
            //   textAlign: TextAlign.center,
            //   decoration: InputDecoration(
            //       hintText: "Nombre del personaje", border: OutlineInputBorder()),
            // ),
          ),
        ),
        Padding(padding: EdgeInsetsDirectional.all(20)),
        Container(
          height: MediaQuery.of(context).size.height - 188,
          child: ListView.builder(
              itemCount: personajes.length,
              itemBuilder: (BuildContext context, int index) {
                Personaje? personaje = personajes[index];
                return PersonajeItemList(personaje: personaje);
              }),
        ),
      ],
    ));
  }
}
