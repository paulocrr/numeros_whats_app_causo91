import 'package:flutter/material.dart';
import 'package:numeros_whats_app/extensions/numero_de_telefono_extension.dart';
import 'package:numeros_whats_app/models/numero_de_telefono.dart';
import 'package:numeros_whats_app/display/routes/routes.dart';

class TarjetaInformacionTelefono extends StatelessWidget {
  const TarjetaInformacionTelefono({
    required this.numeroDeTelefono,
    required this.alBorrar,
    super.key,
  });

  final NumeroDeTelefono numeroDeTelefono;
  final void Function(NumeroDeTelefono) alBorrar;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detalleNumero,
            arguments: numeroDeTelefono,
          );
        },
        title: Text(numeroDeTelefono.numeroDeTelefonoFormateado),
        subtitle: Text(numeroDeTelefono.descripcion),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                numeroDeTelefono.abrirTelefono();
              },
              icon: Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                numeroDeTelefono.abrirEnWhatsApp();
              },
              icon: Icon(
                Icons.person,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                alBorrar(numeroDeTelefono);
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
