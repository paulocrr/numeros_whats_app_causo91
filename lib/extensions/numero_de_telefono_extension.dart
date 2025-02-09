import 'package:numeros_whats_app/models/numero_de_telefono.dart';
import 'package:url_launcher/url_launcher.dart';

extension NumeroDeTelefonoExtension on NumeroDeTelefono {
  void abrirEnWhatsApp({String? mensaje}) {
    final urlString = 'https://wa.me/$numeroDeTelefonoPlano';
    if (mensaje != null) {
      final mensajeCodificado = Uri.encodeComponent(mensaje);
      final url = Uri.parse('$urlString?text=$mensajeCodificado');
      launchUrl(url);
    } else {
      final url = Uri.parse(urlString);
      launchUrl(url);
    }
  }

  void abrirTelefono() {
    final url = Uri.parse('tel:$numeroDeTelefonoPlano');
    launchUrl(url);
  }
}
