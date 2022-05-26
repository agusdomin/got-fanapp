import 'package:flutter/material.dart';
import 'package:got_fanapp/models/personaje.dart';
import 'package:got_fanapp/routes.dart';

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
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: widget.personaje,
                child: (Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.vertical(
                          bottom: Radius.circular(30)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.personaje.imageUrl))),
                )),
              ),
              Positioned(
                  top: 40,
                  left: 30,
                  child: ElevatedButton(
                      onPressed: (() =>
                          {Navigator.pushNamed(context, Routes.home)}),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          )))),
            ],
          ),
          Padding(padding: EdgeInsetsDirectional.only(top: 20)),
          Text(
            widget.personaje.fullName,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsetsDirectional.only(top: 30)),
          Text(
            widget.personaje.title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Padding(padding: EdgeInsetsDirectional.only(top: 30)),
          Text(
            widget.personaje.family,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Padding(padding: EdgeInsetsDirectional.only(top: 100)),
          ElevatedButton.icon(
              onPressed: (() => print("aniadido a favoritos")),
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: Text(
                "Añadir a favoritos",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              )))
        ],
      ),
    );
  }
}
