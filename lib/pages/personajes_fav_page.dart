import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/cubit/personajes_cubit.dart';
import 'package:got_fanapp/cubit/personajes_state.dart';

import 'package:got_fanapp/routes.dart';

import 'package:got_fanapp/widgets/personajes_fav_pageview.dart';
import 'package:http/http.dart' as http;

class PersonajesFavPage extends StatefulWidget {
  const PersonajesFavPage({Key? key}) : super(key: key);

  @override
  State<PersonajesFavPage> createState() => _PersonajesFavPageState();
}

class _PersonajesFavPageState extends State<PersonajesFavPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonajesCubit, PersonajesState>(
      builder: (context, state) {
        if (state is PersonajesInitial) {
        } else if (state is PersonajesLoading) {
          return const CircularProgressIndicator();
        } else if (state is PersonajesEmpty) {
          return const Text("No hay datos");
        }
        print(state.personajesFavs);
        return PersonajesFavPageView(
          personajes: state.personajesFavs,
        );
      },
    );
  }
}
