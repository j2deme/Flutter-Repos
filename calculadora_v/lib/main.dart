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
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora'),
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
  ButtonStyle btnOperador(BuildContext context) => ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.onPrimary),
      backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary));

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
            // Display de la calculadora
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                    child: const Text(
                      "1234567890",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("7")),
                ElevatedButton(onPressed: () {}, child: const Text("8")),
                ElevatedButton(onPressed: () {}, child: const Text("9")),
                ElevatedButton(
                    onPressed: () {},
                    style: btnOperador(context),
                    child: const Text("/"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("4")),
                ElevatedButton(onPressed: () {}, child: const Text("5")),
                ElevatedButton(onPressed: () {}, child: const Text("6")),
                ElevatedButton(
                    onPressed: () {},
                    style: btnOperador(context),
                    child: const Text("x"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("1")),
                ElevatedButton(onPressed: () {}, child: const Text("2")),
                ElevatedButton(onPressed: () {}, child: const Text("3")),
                ElevatedButton(
                    onPressed: () {},
                    style: btnOperador(context),
                    child: const Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text(".")),
                ElevatedButton(onPressed: () {}, child: const Text("0")),
                ElevatedButton(
                    onPressed: () {},
                    style: btnOperador(context),
                    child: const Text("=")),
                ElevatedButton(
                    onPressed: () {},
                    style: btnOperador(context),
                    child: const Text("+"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
