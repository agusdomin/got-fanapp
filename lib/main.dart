import 'package:flutter/material.dart';
import 'package:got_fanapp/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoT Fan App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: routes,
      initialRoute: Routes.home,
    );
  }
}
