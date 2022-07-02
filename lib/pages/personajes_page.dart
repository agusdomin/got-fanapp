import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/cubit/personajes_cubit.dart';
import 'package:got_fanapp/cubit/personajes_state.dart';

import 'package:got_fanapp/widgets/personajes_searcher.dart';

class PersonajesPage extends StatefulWidget {
  const PersonajesPage({Key? key}) : super(key: key);

  @override
  State<PersonajesPage> createState() => _PersonajesPageState();
}

class _PersonajesPageState extends State<PersonajesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          color: Colors.black,
          child: Text(
            "Personajes",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: BlocBuilder<PersonajesCubit, PersonajesState>(
        builder: (context, state) {
          debugPrint("""$state""");
          if (state is PersonajesInitial) {
          } else if (state is PersonajesLoading) {
            return const CircularProgressIndicator();
          } else if (state is PersonajesEmpty) {
            return const Text("No hay datos");
          }
          return PersonajesSearcher(
            personajes: state.personajesFiltrados,
          );
        },
      ),
    );
  }
}
