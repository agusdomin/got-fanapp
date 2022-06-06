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
    return BlocBuilder<PersonajesCubit, PersonajesState>(
      builder: (context, state) {
        if (state is PersonajesInitial) {
        } else if (state is PersonajesLoading) {
          return const CircularProgressIndicator();
        } else if (state is PersonajesFetched) {
          return PersonajesFavPageView(
            personajes: state.personajesAll,
          );
        } else if (state is PersonajesEmpty) {
          return const Text("No hay datos");
        }
        return const Text("Debido a un error no pueden mostrarse los datos");
        // Error
      },
      // child: Container(
      //     margin: EdgeInsetsDirectional.all(50.0),
      //     height: 800,
      //     width: 400,
      //     child: FutureBuilder<List<Personaje>>(
      //       //future: _getDataFuture(),
      //       builder: ((context, snapshot) {
      //         if (snapshot.hasError) {
      //           return AddPersonajeFavCard();
      //         } else if (snapshot.hasData && snapshot.data != null) {
      //           int lastIndex = (snapshot.data?.length ?? 0) + 1;
      //           return PageView.builder(
      //             pageSnapping: true,
      //             itemCount: lastIndex,
      //             itemBuilder: (BuildContext context, int index) {
      //               if (index < lastIndex - 1) {
      //                 Personaje? personaje = snapshot.data?[index] ??
      //                     Personaje(
      //                         id: 1,
      //                         firstName: "firstName",
      //                         lastName: "lastName",
      //                         fullName: "fullName",
      //                         title: "title",
      //                         family: "family",
      //                         image: "image",
      //                         imageUrl: "imageUrl");
      //                 return PersonajeFavCard(
      //                   personaje: personaje,
      //                 );
      //               } else {
      //                 return AddPersonajeFavCard();
      //               }
      //             },
      //           );
      //         }

      //         return const CircularProgressIndicator();
      //       }),
      //     )),
    );
  }
}

//  @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PersonajeFavCubit,PersonajeFavState>(
//       builder: ((context, state) {
//         if(state is FavsInitial){
//         } else if (state is FavsLoading){
//         } else if (state is FavsFetched){
//         } else if (state is FavsEmpty){
//         } else { // Error
//         } 
//         Container(
//           margin: EdgeInsetsDirectional.all(50.0),
//           height: 800,
//           width: 400,
//           child: FutureBuilder<List<Personaje>>(
//             //future: _getDataFuture(),
//             future: PersonajeService(),
//             builder: ((context, snapshot) {
//               if (snapshot.hasError) {
//                 return AddPersonajeFavCard();
//               } else if (snapshot.hasData && snapshot.data != null) {
//                 int lastIndex = (snapshot.data?.length ?? 0) + 1;
//                 return PageView.builder(
//                   pageSnapping: true,
//                   itemCount: lastIndex,
//                   itemBuilder: (BuildContext context, int index) {
//                     if (index < lastIndex - 1) {
//                       Personaje? personaje = snapshot.data?[index] ??
//                           Personaje(
//                               id: 1,
//                               firstName: "firstName",
//                               lastName: "lastName",
//                               fullName: "fullName",
//                               title: "title",
//                               family: "family",
//                               image: "image",
//                               imageUrl: "imageUrl");
//                       return PersonajeFavCard(
//                         personaje: personaje,
//                       );
//                     } else {
//                       return AddPersonajeFavCard();
//                     }
//                   },
//                 );
//               }
    
//               return const CircularProgressIndicator();
//             }),
            
//           )),
//       }),
     
//     );
//   }