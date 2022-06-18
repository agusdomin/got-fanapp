import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_fanapp/cubit/personajes_cubit.dart';
import 'package:got_fanapp/cubit/personajes_state.dart';
import 'package:got_fanapp/pages/info_page.dart';
import 'package:got_fanapp/pages/personajes_page.dart';

class PersonajeInfo extends StatelessWidget {
  PersonajeInfo({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final InfoPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    onPressed: (() => {Navigator.pop(context)}),
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
        BlocBuilder<PersonajesCubit, PersonajesState>(
          builder: (context, state) {
            final personajesCubit = context.read<PersonajesCubit>();
            return (ElevatedButton.icon(
                onPressed: (() => {personajesCubit.emit(state.copyWith())}),
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
                ))));
          },
        )
      ],
    );
  }
}
