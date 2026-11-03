import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/selectable_scale_item.dart';

const _itensEcog = [
  '0 — Totalmente ativo, capaz de realizar todas as atividades sem restrição',
  '1 — Restrito para atividades físicas extenuantes, mas ambulatorial e capaz '
      'de realizar trabalhos leves',
  '2 — Ambulatorial e capaz de autocuidado, mas incapaz de realizar qualquer '
      'atividade de trabalho; em pé mais de 50% das horas em vigília',
  '3 — Capaz apenas de autocuidado limitado; confinado ao leito ou cadeira '
      'mais de 50% das horas em vigília',
  '4 — Totalmente incapacitado; não é capaz de realizar qualquer autocuidado; '
      'totalmente confinado ao leito ou cadeira',
];

class EscalaEcogScreen extends StatefulWidget {
  const EscalaEcogScreen({super.key});

  @override
  State<EscalaEcogScreen> createState() => _EscalaEcogScreenState();
}

class _EscalaEcogScreenState extends State<EscalaEcogScreen> {
  int? _selecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escala ECOG')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          for (var i = 0; i < _itensEcog.length; i++)
            SelectableScaleItem(
              texto: _itensEcog[i],
              selecionado: _selecionado == i,
              onTap: () => setState(() => _selecionado = i),
            ),
        ],
      ),
    );
  }
}
