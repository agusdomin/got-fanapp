import 'package:flutter/material.dart';

import 'package:got_fanapp/routes.dart';

class AddPersonajeFavCard extends StatelessWidget {
  AddPersonajeFavCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, Routes.personajes)},
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 400,
            height: 580,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 10, color: Colors.grey)),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.grey,
                    radius: 70,
                    child: Ink(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 3, color: Colors.grey)),
                        child: Icon(
                          Icons.add,
                          size: 100,
                          color: Colors.grey,
                        )),
                  ),
                  Padding(padding: EdgeInsetsDirectional.only(top: 20)),
                  Text("Añadir un personaje"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
