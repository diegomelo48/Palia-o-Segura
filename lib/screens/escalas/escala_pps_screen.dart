import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/selectable_scale_item.dart';

/// Cada nível resume: Deambulação | Atividade/Evidência de doença |
/// Autocuidado | Ingesta | Nível de consciência.
const _itensPps = [
  '100% — Deambula normalmente; atividade e trabalho normais, sem evidência '
      'de doença; autocuidado total; ingesta normal; consciente',
  '90% — Deambula normalmente; atividade normal, alguma evidência de doença; '
      'autocuidado total; ingesta normal; consciente',
  '80% — Deambula normalmente; atividade normal com esforço, alguma evidência '
      'de doença; autocuidado total; ingesta normal ou reduzida; consciente',
  '70% — Deambulação reduzida; incapaz de trabalho/atividade normal, doença '
      'significativa; autocuidado total; ingesta normal ou reduzida; consciente',
  '60% — Deambulação reduzida; incapaz de hobbies/trabalho doméstico, doença '
      'significativa; assistência ocasional necessária; ingesta normal ou '
      'reduzida; consciente ou confuso',
  '50% — Maior parte do tempo sentado ou deitado; incapaz de qualquer '
      'trabalho, doença extensa; assistência considerável necessária; ingesta '
      'normal ou reduzida; consciente ou confuso',
  '40% — Maior parte do tempo acamado; incapaz da maioria das atividades, '
      'doença extensa; assistência quase total; normal ou reduzida; consciente '
      'ou sonolento ± confuso',
  '30% — Totalmente acamado; incapaz de qualquer atividade, doença extensa; '
      'cuidado total; reduzida; consciente ou sonolento ± confuso',
  '20% — Totalmente acamado; incapaz de qualquer atividade, doença extensa; '
      'cuidado total; mínima, goles; consciente ou sonolento ± confuso',
  '10% — Totalmente acamado; incapaz de qualquer atividade, doença extensa; '
      'cuidado total; cuidados apenas com a boca; sonolento ou coma ± confuso',
  '0% — Óbito',
];

class EscalaPpsScreen extends StatefulWidget {
  const EscalaPpsScreen({super.key});

  @override
  State<EscalaPpsScreen> createState() => _EscalaPpsScreenState();
}

class _EscalaPpsScreenState extends State<EscalaPpsScreen> {
  int? _selecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escala PPS')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          for (var i = 0; i < _itensPps.length; i++)
            SelectableScaleItem(
              texto: _itensPps[i],
              selecionado: _selecionado == i,
              onTap: () => setState(() => _selecionado = i),
            ),
        ],
      ),
    );
  }
}
