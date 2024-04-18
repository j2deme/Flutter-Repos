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
      home: const MyHomePage(title: 'Manejo de Gestos'),
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
  Color color = Colors.green;
  Color color2 = Colors.pink;
  double h = 100;
  double w = 100;
  double r = 10;

  List<Map<String, dynamic>> food = [
    {"name": "Pizza", "icon": Icons.local_pizza},
    {"name": "Hamburguesa", "icon": Icons.lunch_dining},
    //{"name": "Manzana", "icon": Icons.apple},
    //{"name": "Ramen", "icon": Icons.ramen_dining},
    //{"name": "Helado", "icon": Icons.icecream}
  ];

  int foodNumber = 0;
  int second = 0;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    foodNumber = food.length;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        second = DateTime.now().second;
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
                    child: const Text(
                      "Gesture Detector",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      color =
                          (color == Colors.green) ? Colors.red : Colors.green;
                    });
                  },
                  onDoubleTap: () {
                    setState(() {
                      color = Colors.green;
                      w = 100;
                      h = 100;
                      r = 10;
                    });
                  },
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      w += 10;
                    });
                  },
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      if (w > 20) {
                        w -= 10;
                      }
                    });
                  },
                  onLongPressStart: (details) {
                    setState(() {
                      r = 50;
                    });
                  },
                  onLongPressEnd: (details) {
                    setState(() {
                      r = 10;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: InkWell(
                    child: Container(
                      width: w,
                      height: h,
                      decoration: BoxDecoration(
                        color: color2,
                        borderRadius: BorderRadius.circular(r),
                      ),
                      child: Center(
                        child: Text(
                          "$foodNumber",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        color2 = (color2 == Colors.pink)
                            ? Colors.amber
                            : Colors.pink;
                      });
                    },
                  ),
                )
              ],
            ),
            const Divider(),
            /*const Dismissible(
              key: Key("Pizza"),
              child: ListTile(
                title: Text("Pizza"),
                leading: Icon(Icons.local_pizza),
              ),
            ),*/
            for (var item in food)
              Dismissible(
                key: Key(item["name"]),
                onDismissed: (direction) {
                  setState(() {
                    foodNumber--;
                    food.remove(item);
                  });
                },
                child: ListTile(
                  title: Text(item["name"]),
                  trailing: Icon(item["icon"]),
                ),
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
                        pressed = !pressed;
                      });
                    },
                    child: const Text(
                      "Animated Container",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: second % 2 == 0 ? 1.0 : 0.5,
                  duration: const Duration(milliseconds: 500),
                  child: const Icon(
                    Icons.favorite,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
                /*AnimatedPositioned(
                  // FIXME: No se mueve
                  duration: const Duration(milliseconds: 500),
                  left: pressed ? 100 : 0,
                  top: pressed ? 100 : 0,
                  child: GestureDetector(
                    child: const Icon(Icons.beach_access),
                    onTap: () {
                      setState(() {
                        pressed = !pressed;
                      });
                    },
                  ),
                )*/
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedCrossFade(
                  firstChild: const Icon(
                    Icons.adb,
                    size: 50,
                  ),
                  secondChild: const Icon(
                    Icons.abc,
                    size: 50,
                  ),
                  crossFadeState: pressed
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
