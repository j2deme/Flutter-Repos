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
      home: const MyHomePage(title: 'Rubik'),
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
    double size = 250.0;

    BoxDecoration cajaRedonda(Color fondo) => BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: fondo,
          border: Border.all(color: Colors.black87, width: 4),
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
            width: size,
            height: size,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: cajaRedonda(Colors.green),
                      height: size / 3,
                      width: size / 3,
                    ),
                    Container(
                      decoration: cajaRedonda(Colors.blue),
                      height: size / 3,
                      width: size / 3,
                    ),
                    Container(
                      decoration: cajaRedonda(Colors.white),
                      height: size / 3,
                      width: size / 3,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: cajaRedonda(Colors.blue),
                      height: size / 3,
                      width: size / 3,
                    ),
                    Container(
                      decoration: cajaRedonda(Colors.orange),
                      height: size / 3,
                      width: size / 3,
                    ),
                    Container(
                      decoration: cajaRedonda(Colors.red),
                      height: size / 3,
                      width: size / 3,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: cajaRedonda(Colors.yellow),
                      height: size / 3,
                      width: size / 3,
                    ),
                    Container(
                      decoration: cajaRedonda(Colors.white),
                      height: size / 3,
                      width: size / 3,
                    ),
                    Container(
                      decoration: cajaRedonda(Colors.blue),
                      height: size / 3,
                      width: size / 3,
                    )
                  ],
                ),
              ],
            )),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
