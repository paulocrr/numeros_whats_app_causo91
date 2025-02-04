import 'package:flutter/material.dart';
import 'package:numeros_whats_app/extensions/numero_de_telefono_extension.dart';
import 'package:numeros_whats_app/models/numero_de_telefono.dart';

class DetallesNumeroDeTelefono extends StatelessWidget {
  const DetallesNumeroDeTelefono({super.key});

  @override
  Widget build(BuildContext context) {
    final numeroDeTelefono =
        ModalRoute.of(context)?.settings.arguments as NumeroDeTelefono?;

    if (numeroDeTelefono == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Número no encontrado'),
        ),
        body: Center(
          child: Text('No se encontro número de telefono'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del número'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Descripcion: ${numeroDeTelefono.descripcion}',
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              numeroDeTelefono.abrirTelefono();
            },
            title: Text(
                'Llamar a: ${numeroDeTelefono.numeroDeTelefonoFormateado}'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                numeroDeTelefono.abrirEnWhatsApp();
              },
              child: Text('Abrir en Whats App'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver'),
            ),
          )
        ],
      ),
    );
  }
}
