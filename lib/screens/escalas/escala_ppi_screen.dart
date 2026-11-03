import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/selectable_scale_item.dart';

class _Grupo {
  final String label;
  final List<String> opcoes;
  final List<double> pontos;
  _Grupo(this.label, this.opcoes, this.pontos);
}

final _grupos = [
  _Grupo('PPS', ['PPS 10–20%', 'PPS 30–50%', 'PPS 60%'], [4, 2.5, 0]),
  _Grupo('Ingesta oral', ['Muito reduzida (goles)', 'Reduzida', 'Normal'],
      [2.5, 1, 0]),
  _Grupo('Edema', ['Presente', 'Ausente'], [1, 0]),
  _Grupo('Dispneia em repouso', ['Presente', 'Ausente'], [3.5, 0]),
  _Grupo('Delirium', ['Presente', 'Ausente'], [4, 0]),
];

class EscalaPpiScreen extends StatefulWidget {
  const EscalaPpiScreen({super.key});

  @override
  State<EscalaPpiScreen> createState() => _EscalaPpiScreenState();
}

class _EscalaPpiScreenState extends State<EscalaPpiScreen> {
  final _selecoes = <int, int>{};

  String get _resultado {
    if (_selecoes.length < _grupos.length) {
      return 'Selecione uma opção em cada grupo para ver o resultado final.';
    }
    var soma = 0.0;
    for (var i = 0; i < _grupos.length; i++) {
      soma += _grupos[i].pontos[_selecoes[i]!];
    }

    final String interpretacao;
    if (soma <= 4) {
      interpretacao = 'Sobrevida estimada: mais de 6 semanas.';
    } else if (soma <= 6) {
      interpretacao = 'Sobrevida estimada: menos de 6 semanas.';
    } else {
      interpretacao = 'Sobrevida estimada: menos de 3 semanas.';
    }
    return 'PPI = $soma → $interpretacao';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escala PPI')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          for (var g = 0; g < _grupos.length; g++) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Text(
                _grupos[g].label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            for (var o = 0; o < _grupos[g].opcoes.length; o++)
              SelectableScaleItem(
                texto: _grupos[g].opcoes[o],
                selecionado: _selecoes[g] == o,
                onTap: () => setState(() => _selecoes[g] = o),
              ),
            const SizedBox(height: AppSpacing.sm),
          ],
          ScaleResultCard(texto: _resultado),
        ],
      ),
    );
  }
}
