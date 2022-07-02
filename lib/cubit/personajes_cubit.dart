import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/cubit/personajes_state.dart';
import 'package:got_fanapp/database.dart';
import 'package:got_fanapp/services/models/personaje.dart';
import 'package:got_fanapp/services/personajes_services.dart';

class PersonajesCubit extends Cubit<PersonajesState> {
  final PersonajeService _service;
  final DatabaseHelper _db;
  PersonajesCubit(this._service, this._db) : super(PersonajesInitial()) {
    _init();
  }

  Future<void> _init() async {
    emit(PersonajesLoading());
    try {
      final personajes = await _service.getPersonajes();
      final personajesFav = await _db.getAllFavs();
      print(personajesFav);
      if (personajes.isEmpty) {
        emit(PersonajesEmpty());
      } else {
        emit(PersonajesFetched(
            personajes: personajes, personajesFav: personajesFav));
      }
    } on Exception {
      emit(PersonajesError());
    }
  }

  void search(String value) {
    emit(state.copyWith(search: value));
  }

  void toggleFav(Personaje personaje) async {
    final favoritos = [...state.personajesFavs];

    if (isFav(personaje)) {
      await _db.deleteFav(personaje.id);
      favoritos.remove(personaje);
      emit(state.copyWith(personajesFav: favoritos
          // .where((element) => element.id != personaje.id)
          // .toList()
          ));
    } else {
      await _db.insertFav(personaje);
      favoritos.add(personaje);
      emit(state.copyWith(personajesFav: favoritos));
    }
  }

  bool isFav(Personaje personaje) {
    final favoritos = state.personajesFavs;
    int fav = state.personajesFavs
        .where((element) => element.id == personaje.id)
        .length;
    if (fav > 0) {
      return true;
    }
    return false;
  }
}
