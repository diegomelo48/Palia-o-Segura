import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/selectable_scale_item.dart';

const _indicadoresGerais = [
  'Piora do estado funcional, dependência crescente nas atividades diárias',
  'Duas ou mais internações não planejadas nos últimos 6 meses',
  'Piora do desempenho funcional / perda de peso significativa nos últimos meses',
  'Sintomas persistentes apesar do tratamento otimizado da(s) condição(ões) de base',
  'Paciente solicita cuidados paliativos ou opta por reduzir/suspender tratamento',
  'Combinação de condições clínicas, fragilidade ou multimorbidade',
];

const _indicadoresClinicos = [
  'Câncer: desempenho funcional em declínio devido a metástases progressivas',
  'Demência/fragilidade: incapaz de se vestir, andar ou comer sem assistência',
  'Doença pulmonar: dispneia em repouso ou com esforço mínimo entre exacerbações',
  'Insuficiência cardíaca: dispneia ou dor torácica em repouso/esforço mínimo',
  'Doença renal: estágio 4–5 com condição em piora, não candidato a diálise',
  'Doença hepática: cirrose com uma ou mais complicações no último ano',
  'AVC: déficits neurológicos persistentes graves após AVC agudo',
  'Doença neurológica: piora funcional, disfagia progressiva',
  'Doença renal: pacientes que optam por não fazer diálise ou descontinuá-la',
  'Multimorbidade: presença de várias condições com carga sintomática crescente',
  'Perda de peso involuntária (>10%) nos últimos 6 meses',
  'Albumina sérica persistentemente baixa sem outra causa reversível',
  'Dependência permanente para a maioria das AVDs',
  'Não é candidato a tratamento de manutenção da vida ou o recusa',
  'Sintomas complexos, incontroláveis, refratários ao tratamento',
  'Cuidador principal não consegue mais dar conta / esgotamento do cuidador',
  'Internações repetidas com pouca ou nenhuma melhora entre elas',
  'Doença renal aguda sobreposta à crônica, recorrente',
  'Infecções recorrentes e/ou pneumonia aspirativa',
  'Fratura de fragilidade (ex.: quadril) em paciente frágil',
  'Deterioração cognitiva rápida e progressiva',
  'Sarcopenia / caquexia progressiva',
  'Sinais clínicos de doença terminal / fase final de vida',
];

class EscalaSpictScreen extends StatefulWidget {
  const EscalaSpictScreen({super.key});

  @override
  State<EscalaSpictScreen> createState() => _EscalaSpictScreenState();
}

class _EscalaSpictScreenState extends State<EscalaSpictScreen> {
  final _gerais = List<bool>.filled(_indicadoresGerais.length, false);
  final _clinicos = List<bool>.filled(_indicadoresClinicos.length, false);
  String _resultado = '';

  void _avaliar() {
    final totalGerais = _gerais.where((v) => v).length;
    final totalClinicos = _clinicos.where((v) => v).length;

    final buffer = StringBuffer()
      ..writeln('⚠️ Atenção: Avaliação de Cuidados Paliativos Indicada')
      ..writeln()
      ..writeln(
          'O paciente apresenta $totalGerais indicador(es) geral(is) e '
          '$totalClinicos indicador(es) clínico(s).')
      ..writeln();

    if (totalGerais >= 2 || totalClinicos >= 1) {
      buffer.write(
        'A presença de 2 ou mais indicadores gerais ou 1 ou mais indicadores '
        'clínicos sugere que a saúde do paciente está se deteriorando.\n\n'
        'Considere:\n'
        '• Revisar tratamento e medicamentos atuais, reduzindo polifarmácia.\n'
        '• Encaminhar para avaliação por equipe de Cuidados Paliativos.\n'
        '• Elaborar plano de cuidados atual e futuro com paciente e família.\n'
        '• Planejar antecipadamente a possível perda de capacidade decisória.\n'
        '• Registrar, compartilhar e revisar os planos de cuidado.',
      );
    } else {
      buffer.write(
        'No momento, não há critérios suficientes para indicar deterioração '
        'significativa da saúde. Manter acompanhamento clínico regular.',
      );
    }

    setState(() => _resultado = buffer.toString());
  }

  Widget _checkboxItem(
      String texto, bool valor, ValueChanged<bool?> onChanged) {
    return CheckboxListTile(
      value: valor,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.secondary,
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(texto, style: const TextStyle(fontSize: 14)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escala SPICT')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('Indicadores gerais', style: Theme.of(context).textTheme.titleMedium),
          for (var i = 0; i < _indicadoresGerais.length; i++)
            _checkboxItem(_indicadoresGerais[i], _gerais[i],
                (v) => setState(() => _gerais[i] = v ?? false)),
          const SizedBox(height: AppSpacing.md),
          Text('Indicadores clínicos', style: Theme.of(context).textTheme.titleMedium),
          for (var i = 0; i < _indicadoresClinicos.length; i++)
            _checkboxItem(_indicadoresClinicos[i], _clinicos[i],
                (v) => setState(() => _clinicos[i] = v ?? false)),
          const SizedBox(height: AppSpacing.md),
          FilledButton(onPressed: _avaliar, child: const Text('Avaliar')),
          ScaleResultCard(texto: _resultado),
        ],
      ),
    );
  }
}
