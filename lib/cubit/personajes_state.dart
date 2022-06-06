import 'package:equatable/equatable.dart';

import 'package:got_fanapp/services/models/personaje.dart';

//Equatable. Facilita la comparacion entre objetos complejos
class PersonajesState extends Equatable {
  final List<Personaje> personajes;
  final String search;

  List<Personaje> get personajesFiltrados {
    return personajes
        .where((element) =>
            search == '' ||
            element.fullName.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  List<Personaje> get personajesAll {
    return personajes.toList();
  }

  int get count => personajesAll.length;

  int get countFiltrados => personajesFiltrados.length;

  const PersonajesState({
    this.personajes = const [],
    this.search = '',
  });

// Copiar este estado y retornar uno nuevo. Se usa para crear los nuevos estados.
// Por la inmutabilidad de flutter, destruye y crea widgets.
  PersonajesState copyWith({
    List<Personaje>? items,
    String? search,
  }) {
    return PersonajesState(
      personajes: items ?? this.personajes,
      search: search ?? this.search,
    );
  }

// get es conocido como una property, escribo como si fuera una funcion pero la llamo como una variable

//  props. Parte de Equatable, declarando los atributos que queremos que compare.
  @override
  List<Object> get props => [personajes, search];
}

class PersonajesInitial extends PersonajesState {
  //PersonajesInitial();
}

class PersonajesLoading extends PersonajesState {}

class PersonajesFetched extends PersonajesState {
  // final List<Personaje> personajesFav;
  // PersonajesFetched(this.personajesFav);
  const PersonajesFetched({
    required List<Personaje> personajes,
  }) : super(personajes: personajes);
}

class PersonajesEmpty extends PersonajesState {
  //PersonajesEmpty();
}

class PersonajesError extends PersonajesState {
  //PersonajesError();
}

class PersonajesBuscado extends PersonajesState {
  const PersonajesBuscado({
    required List<Personaje> personajes,
    required String search,
  }) : super(personajes: personajes, search: search);
}
