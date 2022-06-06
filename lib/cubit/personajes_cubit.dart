import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/cubit/personajes_state.dart';
import 'package:got_fanapp/services/personajes_services.dart';
import 'package:http/http.dart';

class PersonajesCubit extends Cubit<PersonajesState> {
  final PersonajeService _service;
  PersonajesCubit(this._service) : super(PersonajesInitial()) {
    _init();
  }

  Future<void> _init() async {
    emit(PersonajesLoading());
    try {
      final personajes = await _service.getPersonajesFav();
      if (personajes.isEmpty) {
        emit(PersonajesEmpty());
      } else {
        emit(PersonajesFetched(personajes: personajes));
      }
    } on Exception {
      emit(PersonajesError());
    }
  }

  void search(String value) {
    print(state.personajes);

    emit(PersonajesBuscado(personajes: state.personajes, search: value));
  }
}
