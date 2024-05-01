import 'package:drawer_v/pages/ajustes_page.dart';
import 'package:drawer_v/pages/perfil_page.dart';
import 'package:drawer_v/pages/principal_page.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Drawer Example'),
      routes: {
        "/principal": (context) => const PrincipalPage(),
        "/perfil": (context) => const PerfilPage(),
        "/ajustes": (context) => const AjustesPage(),
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
    List<ListTile> tiles = [
      ListTile(
        title: const Text('Inicio'),
        leading: const Icon(Icons.home),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: const Text('Perfil'),
        leading: const Icon(Icons.person),
        onTap: () {
          Navigator.pushNamed(context, "/perfil");
        },
      ),
      ListTile(
        title: const Text('Configuración'),
        leading: const Icon(Icons.settings),
        onTap: () {
          Navigator.pushNamed(context, "/ajustes");
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Jaime Delgado"),
              accountEmail: Text("jesus.delgado@tecvalles.mx"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/1148641?v=4"),
              ),
              currentAccountPictureSize: Size(50, 50),
            ),
            ...tiles,
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Inicio',
            ),
          ],
        ),
      ),
    );
  }
}
