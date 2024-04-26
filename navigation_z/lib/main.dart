import 'package:flutter/material.dart';
import 'package:navigation_z/my_home_page.dart';
import 'package:navigation_z/pantalla2.dart';
import 'package:navigation_z/pantalla3.dart';
import 'package:navigation_z/pantalla4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Pantalla 1'),
      routes: {
        '/inicio': (context) => const MyHomePage(title: "Pantalla 1"),
        '/azul': (context) => const Pantalla2(),
        '/verde': (context) => const Pantalla3(),
        '/naranja': (context) => const Pantalla4(),
        '/pastel': (context) => const Pantalla4(),
      },
    );
  }
}
