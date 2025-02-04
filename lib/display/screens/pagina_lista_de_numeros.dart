import 'package:flutter/material.dart';
import 'package:numeros_whats_app/display/ui/tarjeta_informacion_telefono.dart';
import 'package:numeros_whats_app/models/numero_de_telefono.dart';

class PaginaListaDeNumeros extends StatefulWidget {
  const PaginaListaDeNumeros({required this.numerosDeTelefono, super.key});

  final List<NumeroDeTelefono> numerosDeTelefono;

  @override
  State<PaginaListaDeNumeros> createState() => _PaginaListaDeNumerosState();
}

class _PaginaListaDeNumerosState extends State<PaginaListaDeNumeros> {
  @override
  Widget build(BuildContext context) {
    if (widget.numerosDeTelefono.isEmpty) {
      return Center(
        child: Text('Usted no tiene numeros guardados'),
      );
    }
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      children: widget.numerosDeTelefono.map((numeroDeTelefono) {
        return TarjetaInformacionTelefono(
          numeroDeTelefono: numeroDeTelefono,
          alBorrar: (numeroDeTelefono) {
            setState(() {
              widget.numerosDeTelefono.removeWhere(
                  (elemento) => elemento.id == numeroDeTelefono.id);
            });
          },
        );
      }).toList(),
    );
  }
}
