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
      title: 'Widgets funcionales',
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
  bool _isChecked = false;

  List<Map<String, dynamic>> toppings = [
    {"value": false, "title": "Pepperoni"},
    {"value": false, "title": "Champiñones"},
    {"value": false, "title": "Pimientos"},
    {"value": false, "title": "Cebolla"},
    {"value": false, "title": "Aceitunas"},
    {"value": false, "title": "Jalapeños"},
    {"value": false, "title": "Piña"}
  ];

  void checkboxChange(bool value, int index) {
    setState(() {
      toppings[index]["value"] = value;
    });
  }

  List<Map<String, dynamic>> tamanios = [
    {"value": "Pequeño", "oz": 10},
    {"value": "Mediano", "oz": 12},
    {"value": "Grande", "oz": 14},
    {"value": "Familiar", "oz": 16}
  ];

  String _seleccionado = "";
  bool suscrito = false;
  double intensidad = 50;

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
                Text("Hola"),
                Text(
                  "Mundo",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.ac_unit),
                Icon(Icons.ac_unit_outlined),
                Icon(Icons.ac_unit_rounded),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.purple,
                  size: 50,
                ),
                Icon(
                  Icons.motorcycle_rounded,
                  color: Colors.blue,
                  size: 30,
                ),
                Icon(
                  Icons.warning_rounded,
                  color: Colors.amber,
                  size: 50,
                ),
                Icon(
                  CommunityMaterialIcons.google_downasaur,
                  color: Colors.green,
                  size: 50,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/logo.png",
                    width: intensidad,
                  ),
                ),
                Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1920px-Google-flutter-logo.svg.png",
                  width: 150,
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Componentes de Formulario",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Botón Elevado"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Botón delineado"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.thumb_up),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Like"),
                      ),
                    ],
                  ),
                ),
                IconButton.filled(
                  onPressed: () {},
                  tooltip: "Like",
                  color: Theme.of(context).colorScheme.onPrimary,
                  icon: const Icon(Icons.thumb_up),
                ),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Nombre",
                hintText: "Escribe tu nombre",
              ),
              key: Key("nameTxt"),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Contraseña",
                hintText: "Escribe tu contraseña",
              ),
              obscureText: true,
              obscuringCharacter: "\$",
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Edad",
                hintText: "Escribe tu edad",
              ),
              validator: (value) {
                var edad = value ?? 0;
                if (edad as int <= 0) {
                  return "Ingrese un valor válido";
                }
                return null;
              },
            ),
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value as bool;
                });
              },
            ),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value as bool;
                    });
                  },
                ),
                const Text("Acepto términos y condiciones"),
              ],
            ),
            CheckboxListTile(
              value: _isChecked,
              title: const Text("Acepto los términos y condiciones"),
              subtitle: const Text("Sino aceptas no puedes continuar"),
              onChanged: (value) {
                setState(() {
                  _isChecked = value as bool;
                });
              },
            ),
            ExpansionTile(
              title: const Text("Checkboxes"),
              children: [
                const Text("Toppings"),
                for (var i = 0; i < toppings.length; i++)
                  CheckboxListTile(
                    value: toppings[i]["value"] as bool,
                    title: Text(toppings[i]["title"] as String),
                    onChanged: (value) {
                      checkboxChange(value as bool, i);
                    },
                  ),
              ],
            ),
            ExpansionTile(
              title: const Text("Radios"),
              children: [
                Text(
                    "Refresco: ${_seleccionado.isNotEmpty ? _seleccionado : "No seleccionado"}"),
                for (var tamanio in tamanios)
                  RadioListTile(
                    value: tamanio["value"],
                    groupValue: _seleccionado,
                    title: Text(tamanio["value"]),
                    subtitle: Text("${tamanio["oz"]} oz"),
                    onChanged: (value) {
                      setState(() {
                        _seleccionado = value as String;
                      });
                    },
                  ),
              ],
            ),
            SwitchListTile(
              title: const Text("Suscrito a EsantosYT"),
              value: suscrito,
              onChanged: (value) {
                setState(() {
                  suscrito = value;
                });
              },
            ),
            Slider(
              label: "Intensidad",
              value: intensidad,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  intensidad = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.outlined(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                      currentDate: DateTime.now(),
                      cancelText: "Cancelar",
                      confirmText: "Seleccionar",
                    );
                  },
                  icon: const Icon(Icons.calendar_month),
                ),
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Suscrito a EsantosYT: $suscrito\nIntensidad: $intensidad"),
                        duration: const Duration(seconds: 5),
                        showCloseIcon: true,
                        backgroundColor: Colors.pinkAccent,
                      ),
                    );
                  },
                  child: const Text("Snackbar"),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: const Text("Hola ModalBottomSheet"),
                        );
                      },
                    );
                  },
                  child: const Text("ModalBottomSheet"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
