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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            )
          ],
        ),
      ),
    );
  }
}
