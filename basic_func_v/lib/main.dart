import 'dart:math';

import 'package:community_material_icon/community_material_icon.dart';
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
      title: 'Widgets Funcionales',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Widgets Funcionales'),
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
  bool marcado = false;

  List<Map<String, dynamic>> toppings = [
    {"value": false, "title": "Pepperoni"},
    {"value": false, "title": "Piña"},
    {"value": false, "title": "Tocino"},
    {"value": false, "title": "Pimientos"},
    {"value": false, "title": "Pastor"},
  ];

  String seleccionado = "";
  List<Map<String, dynamic>> tamanios = [
    {"value": "Chico", "oz": 10},
    {"value": "Mediano", "oz": 20},
    {"value": "Grande", "oz": 30},
  ];

  double intensidad = Random().nextDouble() * 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Hola",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Mundo",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.purple,
                    backgroundColor: Colors.amber,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.face),
                  Icon(Icons.face_outlined),
                  Icon(Icons.face_rounded),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.deepOrange,
                    size: 40,
                  ),
                  Icon(Icons.cake),
                  Icon(
                    CommunityMaterialIcons.google_downasaur,
                    color: Colors.pink,
                    size: 50,
                  ),
                  Icon(CommunityMaterialIcons.allergy)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/512px-Google-flutter-logo.svg.png",
                  width: 250,
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Botón elevado"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Botón con borde"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.thumb_up),
                      Text(" Like"),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Link"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_down),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Nombre",
                hintText: "Escribe tu nombre",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Contraseña",
                hintText: "Escribe tu contraseña",
              ),
              obscureText: true,
            ),
            Checkbox(
                value: marcado,
                onChanged: (value) {
                  setState(() {
                    marcado = value as bool;
                  });

                  //print("Checkbox ${value}");
                }),
            Row(
              children: [
                Checkbox(
                    value: marcado,
                    onChanged: (value) {
                      setState(() {
                        marcado = value as bool;
                      });
                    }),
                const Text("Acepto los términos y condiciones"),
              ],
            ),
            CheckboxListTile(
                value: marcado,
                title: const Text("Acepto los términos y condiciones"),
                subtitle: const Text("Acepta o no podrás continuar"),
                onChanged: (value) {
                  setState(() {
                    marcado = value as bool;
                  });
                }),
            ExpansionTile(
              title: const Text("Toppings"),
              children: [
                for (var ingrediente in toppings)
                  CheckboxListTile(
                    value: ingrediente["value"] as bool,
                    title: Text(ingrediente["title"] as String),
                    onChanged: (value) {
                      // Actualiza el estado
                      setState(() {
                        ingrediente["value"] = value;
                      });
                    },
                  )
              ],
            ),
            ExpansionTile(
              title: Text(
                  "Refresco ${(seleccionado.isNotEmpty) ? seleccionado : "Sin seleccionar"}"),
              children: [
                for (var tamanio in tamanios)
                  RadioListTile(
                      value: tamanio["value"] as String,
                      groupValue: seleccionado,
                      title: Text(tamanio["value"] as String),
                      subtitle: Text("${tamanio["oz"]} oz"),
                      onChanged: (value) {
                        setState(() {
                          seleccionado = value as String;
                        });
                      })
              ],
            ),
            ExpansionTile(
              title: const Text("Switches"),
              children: [
                for (var ingrediente in toppings)
                  SwitchListTile(
                      value: ingrediente["value"],
                      title: Text(ingrediente["title"]),
                      onChanged: (value) {
                        setState(() {
                          ingrediente["value"] = value;
                        });
                      })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Slider(
                  value: intensidad,
                  min: 0,
                  max: 100,
                  //divisions: 10,
                  label: intensidad.toStringAsFixed(2),
                  onChanged: (value) {
                    setState(() {
                      intensidad = value;
                    });
                  },
                ),
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(intensidad / 100),
                      borderRadius: BorderRadius.circular(15),
                    ))
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Fecha de Nacimiento",
                hintText: "Selecciona tu fecha de nacimiento",
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  //initialDate: DateTime.now(), // Si se descomenta, el widget intenta inicializarse en la fecha actual y falla, porque esta limitado entre las fechas siguientes.
                  firstDate: DateTime(1980, 1, 1),
                  lastDate: DateTime(DateTime.now().year - 18),
                );
                //showTimePicker(context: context, initialTime: TimeOfDay.now());
              },
            ),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Hola mundo"),
                  duration: Duration(seconds: 5),
                  showCloseIcon: true,
                  backgroundColor: Colors.pink,
                ));
              },
              child: const Text("Snackbar"),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
