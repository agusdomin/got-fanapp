import 'package:flutter/material.dart';

import 'package:got_fanapp/routes.dart';
import 'package:got_fanapp/services/models/personaje.dart';
import 'package:got_fanapp/widgets/personaje_info.dart';

class InfoPageArguments {
  final Personaje personaje;
  InfoPageArguments(this.personaje);
}

class InfoPage extends StatefulWidget {
  Personaje personaje;
  InfoPage({required this.personaje, Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersonajeInfo(widget: widget),
    );
  }
}
