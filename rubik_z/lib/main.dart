import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rubik',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cara Rubik'),
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
  double size = 250;

  BoxDecoration cajaRedonda(Color fondo) => BoxDecoration(
        color: fondo,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black.withOpacity(0.8),
          width: 5,
        ),
      );

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size / 3,
                  height: size / 3,
                  decoration: cajaRedonda(Colors.green),
                ),
                Container(
                  width: size / 3,
                  height: size / 3,
                  decoration: cajaRedonda(Colors.blue),
                ),
                Container(
                  width: size / 3,
                  height: size / 3,
                  decoration: cajaRedonda(Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size / 3,
                  height: size / 3,
                  decoration: cajaRedonda(Colors.blue),
                ),
                Container(
                  width: size / 3,
                  height: size / 3,
                  decoration: cajaRedonda(Colors.deepOrange),
                ),
                Container(
                  width: size / 3,
                  height: size / 3,
                  decoration: cajaRedonda(Colors.red),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size / 3,
                  height: size / 3,
                  decoration: cajaRedonda(Colors.yellow),
                ),
                Container(
                  width: size / 3,
                  height: size / 3,
                  decoration: cajaRedonda(Colors.white),
                ),
                Container(
                  width: size / 3,
                  height: size / 3,
                  decoration: cajaRedonda(Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
