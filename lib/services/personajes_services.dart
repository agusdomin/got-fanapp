import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:got_fanapp/services/models/personaje.dart';

class PersonajeService {
  Future<List<Personaje>> getPersonajes() async {
    return http
        .get(Uri.parse("https://thronesapi.com/api/v2/Characters"))
        .then((response) {
      return personajesFromJson(response.body);
    });
  }
}
