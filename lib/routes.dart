import 'package:flutter/material.dart';
import 'package:got_fanapp/models/personaje.dart';

import 'package:got_fanapp/pages/home_page.dart';
import 'package:got_fanapp/pages/info_page.dart';
import 'package:got_fanapp/pages/personajes_page.dart';
import 'package:got_fanapp/pages/casas_page.dart';

class Routes {
  static const String home = '/';
  static const String info = '/info';
  static const String personajes = '/personajes';
  static const String casas = '/casas';
}

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(builder: (_) => HomePage(), settings: settings);
    case Routes.info:
      final InfoPageArguments args = settings.arguments as InfoPageArguments;
      return MaterialPageRoute(
          builder: (_) => InfoPage(personaje: args.personaje),
          settings: settings);
    case Routes.personajes:
      return MaterialPageRoute(
          builder: (_) => PersonajesPage(), settings: settings);
    case Routes.casas:
      return MaterialPageRoute(builder: (_) => CasasPage(), settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Text('404'),
              ),
          settings: settings);
  }
}
