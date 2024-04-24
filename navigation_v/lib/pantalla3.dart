import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Icon(Icons.three_g_mobiledata),
          backgroundColor: Colors.orange,
        ),
        body: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Center(
            child: Icon(
              Icons.swipe_outlined,
              color: Colors.purple,
              size: 40,
            ),
          ),
        ));
  }
}
