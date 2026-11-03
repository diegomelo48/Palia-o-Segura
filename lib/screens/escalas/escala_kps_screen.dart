import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/selectable_scale_item.dart';

const _itensKps = [
  '100 — Normal, sem queixas, sem evidência de doença',
  '90 — Capaz de atividade normal, sinais/sintomas mínimos de doença',
  '80 — Atividade normal com esforço, alguns sinais/sintomas de doença',
  '70 — Cuida de si mesmo, incapaz de atividade normal ou trabalho ativo',
  '60 — Requer assistência ocasional, mas cuida da maioria das necessidades',
  '50 — Requer assistência considerável e cuidados médicos frequentes',
  '40 — Incapacitado, requer cuidados e assistência especiais',
  '30 — Totalmente incapacitado, indicada hospitalização',
  '20 — Muito doente, hospitalização necessária, tratamento ativo necessário',
  '10 — Moribundo, processos fatais progredindo rapidamente',
  '0 — Óbito',
];

class EscalaKpsScreen extends StatefulWidget {
  const EscalaKpsScreen({super.key});

  @override
  State<EscalaKpsScreen> createState() => _EscalaKpsScreenState();
}

class _EscalaKpsScreenState extends State<EscalaKpsScreen> {
  int? _selecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escala KPS')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          for (var i = 0; i < _itensKps.length; i++)
            SelectableScaleItem(
              texto: _itensKps[i],
              selecionado: _selecionado == i,
              onTap: () => setState(() => _selecionado = i),
            ),
        ],
      ),
    );
  }
}
