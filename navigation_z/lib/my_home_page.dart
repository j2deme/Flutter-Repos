import 'package:flutter/material.dart';
import 'package:navigation_z/pantalla2.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Pantalla2(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.lightBlue,
                    width: 100,
                    height: 100,
                    child: const Icon(
                      Icons.ac_unit,
                      size: 50,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/verde'),
                  child: Container(
                    color: Colors.green,
                    width: 100,
                    height: 100,
                    child: const Icon(
                      Icons.adb,
                      size: 50,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/naranja'),
                  child: Container(
                    color: Colors.orange,
                    width: 100,
                    height: 100,
                    child: const Icon(
                      Icons.cake,
                      size: 50,
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
