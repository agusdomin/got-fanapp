import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/models/personaje.dart';

class PersonajesState extends Equatable {
  final List<Personaje> personajes;
  final String search;

  List<Personaje> get personajesFiltrados {
    print(personajes);
    print(search);

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
  const PersonajesState({
    this.personajes = const [],
    this.search = '',
  });

  PersonajesState copyWith({
    List<Personaje>? items,
    String? search,
  }) {
    return PersonajesState(
      personajes: items ?? this.personajes,
      search: search ?? this.search,
    );
  }

  @override
  List<Object> get props => [personajes, search];
}

class PersonajesInitial extends PersonajesState {
  //PersonajesInitial();
}

class PersonajesLoading extends PersonajesState {
  //PersonajesLoading();
}

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
