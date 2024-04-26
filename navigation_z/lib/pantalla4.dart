import 'package:flutter/material.dart';

class Pantalla4 extends StatelessWidget {
  const Pantalla4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla 4"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Center(
              child: Icon(
                Icons.cake,
                size: 100,
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.popUntil(
              context,
              ModalRoute.withName('/'),
            ),
            child: const Center(
              child: Icon(
                Icons.cake,
                size: 100,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
