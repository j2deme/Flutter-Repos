import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Icon(Icons.add_circle),
          backgroundColor: Colors.green,
        ),
        body: InkWell(
          onTap: () => Navigator.pushNamed(context, '/pantalla3'),
          child: const Center(
            child: Icon(
              Icons.shield,
              size: 40,
            ),
          ),
        ));
  }
}
