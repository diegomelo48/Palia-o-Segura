import 'package:flutter/material.dart';

/// Ícone de imagem carregado de assets/icons/, usando o MESMO nome do
/// drawable original do app nativo (ex: "ic_ecog" -> assets/icons/ic_ecog.png).
///
/// Se o arquivo ainda não tiver sido colocado na pasta assets/ (ou o
/// pubspec.yaml ainda não tiver sido atualizado com o caminho), mostra um
/// ícone de fallback cinza no lugar, em vez de quebrar a tela.
///
/// IMPORTANTE: registre a pasta assets/icons/ no pubspec.yaml:
///   flutter:
///     assets:
///       - assets/icons/
class AppIcon extends StatelessWidget {
  /// Nome do arquivo SEM extensão, igual ao nome do drawable original
  /// (ex: "ic_ecog", "ic_cad1", "ic_protocolos").
  final String name;
  final double size;
  final Color? color;

  const AppIcon(
    this.name, {
    super.key,
    this.size = 28,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/$name.png',
      width: size,
      height: size,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.image_not_supported_outlined,
        size: size,
        color: color ?? Colors.grey,
      ),
    );
  }
}
