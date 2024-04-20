import 'dart:async';

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
      title: 'Gestos en Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Interacción con Gestos'),
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
  Color color = Colors.blue;
  double w = 100;
  double h = 100;
  double r = 10;

  List<Map<String, dynamic>> alumnos = [
    {"nombre": "Karina", "edad": 22},
    {"nombre": "Alexis", "edad": 21},
    /*{"nombre": "Xally", "edad": 21},
    {"nombre": "Esteban", "edad": 23},
    {"nombre": "Mike", "edad": 22},*/
  ];

  int segundo = 0;
  bool presionado = false;

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        segundo = DateTime.now().second;
      });
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(r),
                    ),
                    child: Text(
                      "$w x $h",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      color = (color == Colors.blue)
                          ? Colors.deepPurple
                          : Colors.blue;
                    });
                  },
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      //if (w > 30) {
                      w += details.primaryDelta!;
                      //}
                    });
                  },
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      h += details.primaryDelta!;
                    });
                  },
                  onDoubleTap: () {
                    setState(() {
                      w = 100;
                      h = 100;
                      color = Colors.blue;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.red,
                  child: Container(
                      width: w,
                      height: h,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(r),
                      ),
                      child: Center(
                        child: Text(alumnos.length.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            )),
                      )),
                  onTap: () {
                    setState(() {
                      r = (r == 10) ? 50 : 10;
                    });
                  },
                )
              ],
            ),
            for (var alumno in alumnos)
              Dismissible(
                key: Key(alumno["nombre"]),
                child: ListTile(
                  title: Text(alumno["nombre"]),
                  trailing: Text(alumno["edad"].toString()),
                ),
                onDismissed: (direction) {
                  setState(() {
                    alumnos.remove(alumno);
                  });
                },
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(r),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        color = Colors.yellow;
                      });
                    },
                  ),
                ),
                AnimatedOpacity(
                  opacity: (segundo % 2 == 0) ? 0.5 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 100,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        presionado = !presionado;
                      });
                    },
                    child: AnimatedCrossFade(
                      firstChild:
                          const Text("123", style: TextStyle(fontSize: 30)),
                      secondChild:
                          const Text("321", style: TextStyle(fontSize: 30)),
                      crossFadeState: !presionado
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 500),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        presionado = !presionado;
                      });
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: !presionado
                          ? const Icon(
                              Icons.lightbulb_outline,
                              size: 50,
                              key: ValueKey("corazon"),
                            )
                          : const Icon(
                              Icons.lightbulb,
                              size: 50,
                              color: Colors.orange,
                              key: ValueKey("estrella"),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Pantalla2()),
                      );
                    },
                    child: Hero(
                      tag: "avatar",
                      child: Image.asset(
                        "assets/avatar.png",
                        width: 100,
                        height: 100,
                      ),
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

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: "avatar",
            child: Image.asset(
              "assets/avatar.png",
              width: 400,
              height: 400,
            ),
          ),
        ),
      ),
    );
  }
}
