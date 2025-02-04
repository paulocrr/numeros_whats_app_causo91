import 'package:flutter/material.dart';
import 'package:numeros_whats_app/display/screens/pagina_agregar_numeros.dart';
import 'package:numeros_whats_app/display/screens/pagina_lista_de_numeros.dart';
import 'package:numeros_whats_app/models/numero_de_telefono.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final numerosDeTelefono = <NumeroDeTelefono>[];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Numero de WhatsApp'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.message),
                child: Text(
                  'Abrir número en WhatsaApp',
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                icon: Icon(Icons.phone),
                child: Text('Lista de números'),
              ),
            ],
            onTap: (tabIndex) {
              if (tabIndex == 1) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
          ),
        ),
        body: TabBarView(children: [
          PaginaAgregarNumeros(
            alAgregar: (numeroDeTelefono) {
              setState(() {
                numerosDeTelefono.add(numeroDeTelefono);
              });
            },
            numerosDeTelefono: numerosDeTelefono,
          ),
          PaginaListaDeNumeros(
            numerosDeTelefono: numerosDeTelefono,
          ),
        ]),
      ),
    );
  }
}
