import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final String nombre;
  final String correo;
  final Color color;

  const PerfilPage({super.key,
    this.nombre="Perfil",
    this.correo="correo@tecvalles.mx",
    this.color=Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    bool hasArguments = ModalRoute.of(context)?.settings.arguments != null;
    final Map<String, dynamic>? args;

    if(hasArguments) {
      args = ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, dynamic>;
    } else {
      args = null;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text((hasArguments) ? args!["nombre"] : nombre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((hasArguments) ? args!["correo"] : correo,
                style: TextStyle(color: color, fontSize: 24)),
            if (hasArguments) const Icon(Icons.android)
          ],
        ),
      ),
    );
  }
}
