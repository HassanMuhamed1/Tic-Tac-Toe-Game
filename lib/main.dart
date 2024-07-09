import 'package:flutter/material.dart';
//import 'package:xo_game/register.dart';

import 'Rigester.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: Register(),
      routes: {
        "home": (BuildContext context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
