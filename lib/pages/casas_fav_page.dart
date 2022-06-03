import 'package:flutter/material.dart';

class CasasFavPage extends StatefulWidget {
  const CasasFavPage({Key? key}) : super(key: key);

  @override
  State<CasasFavPage> createState() => _CasasFavPageState();
}

class _CasasFavPageState extends State<CasasFavPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text("No hay datos posibles")],
      ),
    );
  }
}
