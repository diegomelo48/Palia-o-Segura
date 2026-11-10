import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Equivalente ao PrivacidadeFragment nativo: exibe a política de
/// privacidade em HTML guardada nos assets do app.
///
/// Coloque o MESMO arquivo do app nativo em:
///   assets/politica_privacidade.html
/// (já registrado no pubspec.yaml).
class PrivacidadeScreen extends StatefulWidget {
  const PrivacidadeScreen({super.key});

  @override
  State<PrivacidadeScreen> createState() => _PrivacidadeScreenState();
}

class _PrivacidadeScreenState extends State<PrivacidadeScreen> {
  late final WebViewController _controller = WebViewController()
    ..loadFlutterAsset('assets/pdfs/politica_privacidade.html');

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
