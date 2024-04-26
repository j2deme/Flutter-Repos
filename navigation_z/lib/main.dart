import 'package:flutter/material.dart';
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
        '/': (context) => const MyHomePage(title: "Pantalla 1"),
        '/azul': (context) => const Pantalla2(),
        '/verde': (context) => const Pantalla3(),
        '/naranja': (context) => const Pantalla4(),
        '/pastel': (context) => const Pantalla4(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Pantalla2(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.lightBlue,
                    width: 100,
                    height: 100,
                    child: const Icon(
                      Icons.ac_unit,
                      size: 50,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/verde'),
                  child: Container(
                    color: Colors.green,
                    width: 100,
                    height: 100,
                    child: const Icon(
                      Icons.adb,
                      size: 50,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/naranja'),
                  child: Container(
                    color: Colors.orange,
                    width: 100,
                    height: 100,
                    child: const Icon(
                      Icons.cake,
                      size: 50,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
