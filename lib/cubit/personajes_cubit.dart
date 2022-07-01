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
    //emit(PersonajesBuscado(personajes: state.personajes, search: value)); es buena solucion tambien
    emit(state.copyWith(
        search:
            value)); // copyWith va a copiar los datos a un nuevo estado, ese estado va a ser la super clase!!!
  }

  // Agregar un metodo que permite agregar favorito, que llame a _db.insertFav
  void toggleFav(Personaje personaje) async {
    final favoritos = state.personajesFavs;
    if (isFav(personaje)) {
      await _db.deleteFav(personaje);
      favoritos.remove(personaje);
      emit(state.copyWith(personajesFav: favoritos));
    } else {
      await _db.insertFav(personaje);
      favoritos.add(personaje);
      emit(state.copyWith(personajesFav: favoritos));
    }
  }

  bool isFav(Personaje personaje) {
    final favoritos = state.personajesFavs;
    if (favoritos.contains(personaje)) {
      return true;
    }
    return false;
  }
}
