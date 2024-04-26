import 'package:flutter/material.dart';
import 'package:navigation_v/pantalla2.dart';
import 'package:navigation_v/pantalla3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int tabActiva = 0;
  var pages = [
    const MyHomePage(title: "Pantalla 1"),
    const Pantalla2(),
    const Pantalla3(),
    const Pantalla2(),
  ];

  var tabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
    const BottomNavigationBarItem(
      icon: Icon(Icons.android),
      label: "Android",
      activeIcon: Icon(
        Icons.android,
        color: Colors.green,
      ),
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.interests_outlined), label: "Figuras"),
    const BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "Otra")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: pages[tabActiva],
        bottomNavigationBar: BottomNavigationBar(
          items: tabs,
          currentIndex: tabActiva,
          onTap: (index) {
            setState(() {
              tabActiva = index;
              //print(tabActiva);
            });
          },
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black54,
        ),
      ),
      routes: {
        '/inicio': (context) => const MyHomePage(title: "Pantalla 1"),
        '/pantalla2': (context) => const Pantalla2(),
        '/vista-detalle': (context) => const Pantalla2(),
        '/pantalla3': (context) => const Pantalla3(),
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
            const Text("Ruta por instanciación"),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pantalla2(),
                  ),
                );
              },
              child: const Icon(
                Icons.account_box,
                size: 50,
              ),
            ),
            const Text("Ruta nombrada"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/vista-detalle');
                  },
                  child: const Icon(
                    Icons.android,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/pantalla3'),
                  child: const Icon(
                    Icons.interests_outlined,
                    size: 50,
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
