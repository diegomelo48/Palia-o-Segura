import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/selectable_scale_item.dart';

const _itensNecpal = [
  'Demência/deterioração cognitiva avançada',
  'Doença pulmonar crônica avançada',
  'Doença cardíaca crônica avançada',
  'Doença hepática crônica grave',
  'Doença neurológica crônica avançada (AVC, ELA, EM, Parkinson)',
  'Doença renal crônica grave (estágio 4–5)',
  'Câncer metastático ou avançado/irressecável',
  'Doença de AIDS avançada',
  'Fragilidade extrema',
  'Múltiplas comorbidades',
  'Outras condições de cronicidade avançada e progressiva',
];

class EscalaNecpalScreen extends StatefulWidget {
  const EscalaNecpalScreen({super.key});

  @override
  State<EscalaNecpalScreen> createState() => _EscalaNecpalScreenState();
}

class _EscalaNecpalScreenState extends State<EscalaNecpalScreen> {
  bool? _perguntaSurpresa; // true = "Sim (não me surpreenderia)"
  bool? _demanda;
  bool? _necessidade;
  final _itens = List<bool?>.filled(_itensNecpal.length, null);

  String _resultado = '';

  void _avaliar() {
    var somatorio = 0;
    if (_demanda == true) somatorio++;
    if (_necessidade == true) somatorio++;
    for (final v in _itens) {
      if (v == true) somatorio++;
    }

    final psPositiva = _perguntaSurpresa == true;
    final necpalPositiva = somatorio > 0;

    final buffer = StringBuffer()
      ..writeln('Pergunta Surpresa: ${psPositiva ? 'POSITIVA' : 'NEGATIVA'}')
      ..writeln('Somatório NECPAL: $somatorio ponto(s)')
      ..writeln('NECPAL: ${necpalPositiva ? 'POSITIVO' : 'NEGATIVO'}');

    if (psPositiva && necpalPositiva) {
      buffer.write(
        '\nClassificação:\nPaciente com Cronicidade Avançada (PCA)\n\n'
        'Revisar o cuidado atual e o plano de cuidados.',
      );
    }

    setState(() => _resultado = buffer.toString());
  }

  Widget _simNao(String label, bool? valor, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Row(
            children: [
              Expanded(
                child: SelectableScaleItem(
                  texto: 'Sim',
                  selecionado: valor == true,
                  onTap: () => onChanged(true),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: SelectableScaleItem(
                  texto: 'Não',
                  selecionado: valor == false,
                  onTap: () => onChanged(false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escala NECPAL')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'Pergunta Surpresa: você se surpreenderia se este paciente '
            'morresse nos próximos 12 meses?',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: SelectableScaleItem(
                  texto: 'Não me surpreenderia',
                  selecionado: _perguntaSurpresa == true,
                  onTap: () => setState(() => _perguntaSurpresa = true),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: SelectableScaleItem(
                  texto: 'Me surpreenderia',
                  selecionado: _perguntaSurpresa == false,
                  onTap: () => setState(() => _perguntaSurpresa = false),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _simNao('Demanda ou necessidade de cuidados percebida pela equipe',
              _demanda, (v) => setState(() => _demanda = v)),
          _simNao('Necessidades paliativas identificadas pelo paciente/família',
              _necessidade, (v) => setState(() => _necessidade = v)),
          Text('Indicadores clínicos de cronicidade avançada',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          for (var i = 0; i < _itensNecpal.length; i++)
            _simNao(_itensNecpal[i], _itens[i],
                (v) => setState(() => _itens[i] = v)),
          const SizedBox(height: AppSpacing.sm),
          FilledButton(onPressed: _avaliar, child: const Text('Avaliar')),
          ScaleResultCard(texto: _resultado),
        ],
      ),
    );
  }
}
