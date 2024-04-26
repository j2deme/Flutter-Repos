import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla 2"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(
            child: Icon(
              Icons.ac_unit,
              size: 100,
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/pastel'),
            child: const Center(
              child: Icon(
                Icons.cake,
                size: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
