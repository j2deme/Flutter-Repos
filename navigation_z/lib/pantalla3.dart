import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla 3"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Icon(
          Icons.adb,
          size: 100,
        ),
      ),
    );
  }
}
