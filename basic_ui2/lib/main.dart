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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.background,
                title: const Text("J2deme")),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                      child: const Center(child: Text("A")),
                    ),
                    Container(
                        color: Colors.yellow,
                        child: const Padding(
                          padding: EdgeInsets.all(50.0),
                          child: Text("B"),
                        )),
                    Container(
                      color: Colors.lime,
                      child: const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text("C"),
                      ),
                    ),
                  ],
                ),
                const Align(alignment: Alignment(-0.7, 0), child: Text("2")),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        color: Colors.blue,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Colors.pink,
                        width: 50,
                        height: 50,
                      )
                    ],
                  ),
                ),
                const Text("4"),
              ],
            )))
        //const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            const Text(
              'Pushaste el botón estas veces:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
