import 'package:flutter/material.dart';
import 'package:navigation_z/my_home_page.dart';
import 'package:navigation_z/pantalla2.dart';
import 'package:navigation_z/pantalla3.dart';
import 'package:navigation_z/pantalla4.dart';

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
  int tabAnterior = 0;
  var pages = [
    const MyHomePage(title: "Pantalla 1"),
    const Pantalla2(),
    const Pantalla3(),
    const Pantalla4(),
  ];

  var tabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
    const BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Azul"),
    const BottomNavigationBarItem(
      icon: Icon(Icons.adb),
      label: "Verde",
      activeIcon: Icon(
        Icons.android,
        color: Colors.green,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.cake),
      label: "Amarillo",
    ),
  ];

  var tabs2 = <Tab>[
    const Tab(icon: Icon(Icons.home), text: "Inicio"),
    const Tab(text: "Azul"),
    const Tab(icon: Icon(Icons.adb), text: "Verde"),
    const Tab(icon: Icon(Icons.cake)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: pages.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Navigation"),
            bottom: TabBar(
              tabs: tabs2,
            ),
          ),
          body: (tabActiva == tabAnterior)
              ? TabBarView(
                  children: pages,
                )
              : pages[tabActiva],
          bottomNavigationBar: BottomNavigationBar(
            items: tabs,
            currentIndex: tabActiva,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.black54,
            onTap: (index) {
              setState(() {
                tabAnterior = tabActiva;
                tabActiva = index;
              });
            },
          ),
        ),
      ),
      //initialRoute: '/inicio',
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
