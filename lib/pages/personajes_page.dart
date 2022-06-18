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
  // Como consumir un endpoint o tomar datos de un json
  // Future<List<Personaje>> _getDataFuture() async {
  //   // return http
  //   //     .get(Uri.parse("https://thronesapi.com/api/v2/Characters"))
  //   //     .then((response) {
  //   //   return personajesFromJson(response.body);
  //   //});
  //   final jsonData = await rootBundle.loadString('jsonFiles/personajes.json');
  //   final list = json.decode(jsonData) as List<dynamic>;

  //   return list.map((e) => Personaje.fromJson(e)).toList();
  // }

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
          return PersonajesSearcher();

          // Error
          //   return(Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       width: 300,
          //       child: TextField(
          //         textAlign: TextAlign.center,
          //         decoration: InputDecoration(
          //             hintText: "Nombre del personaje",
          //             border: OutlineInputBorder()),
          //       ),
          //     ),
          //     Padding(padding: EdgeInsetsDirectional.all(20)),
          //     Container(
          //       height: MediaQuery.of(context).size.height - 188,
          //       child: FutureBuilder<List<Personaje>>(
          //         builder: ((context, snapshot) {
          //           if (snapshot.hasError) {
          //             return Text("No hay informacion");
          //           } else if (snapshot.hasData && snapshot.data != null) {
          //             return ListView.builder(
          //                 itemCount: snapshot.data?.length,
          //                 itemBuilder: (BuildContext context, int index) {
          //                   Personaje? personaje = snapshot.data?[index] ??
          //                       Personaje(
          //                           id: 1,
          //                           firstName: "firstName",
          //                           lastName: "lastName",
          //                           fullName: "fullName",
          //                           title: "title",
          //                           family: "family",
          //                           image: "image",
          //                           imageUrl: "imageUrl");
          //                   return PersonajeItemList(personaje: personaje);
          //                 });
          //           }
          //           return const CircularProgressIndicator();
          //         }),
          //         future: _getDataFuture(),
          //       ),
          //     ),
          //   ],
          // ));
        },
      ),
    );
  }
}
