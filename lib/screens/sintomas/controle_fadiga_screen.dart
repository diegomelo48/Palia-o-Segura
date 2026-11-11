import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/accordion_section.dart';

class ControleFadigaScreen extends StatelessWidget {
  const ControleFadigaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controle da Fadiga')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'Sintoma de alta prevalência e difícil alívio. A fadiga é um '
            'sintoma complexo, frequentemente negligenciado, com forte '
            'impacto na funcionalidade e dependência.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          const AccordionSection(
            titulo: 'Avaliação Inicial',
            conteudo: Text(
              '• Avaliar funcionalidade global.\n'
              '• A fadiga frequentemente ocorre em cluster com anorexia e '
              'boca seca.\n'
              '• Avaliar perda de peso e impacto na autonomia.\n',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Medidas Não Medicamentosas',
            conteudo: Text(
              'Conservação de Energia:\n'
              '• Programar atividades prazerosas uma de cada vez.\n'
              '• Eliminar tarefas não essenciais.\n\n'
              'Exercícios:\n'
              '• Atividade aeróbica leve conforme tolerado.\n'
              '• Fisioterapia para manutenção funcional.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Manejo Medicamentoso',
            conteudo: Text(
              'Psicoestimulantes:\n'
              '• Metilfenidato (Ritalina) ou Modafinila podem ser '
              'considerados, especialmente se houver sonolência associada '
              '(uso controverso).\n\n'
              'Corticosteroides:\n'
              '• Dexametasona (ex: 4mg/dia) pode melhorar vigor, apetite e '
              'bem-estar por curto prazo.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Suporte Nutricional',
            conteudo: Text(
              '• Aconselhamento nutricional precoce.\n'
              '• Oferecer porções pequenas em pratos pequenos.\n'
              '• Suplementação oral quando indicada.\n'
              '• Não forçar a alimentação se o paciente não desejar.\n'
              '• Objetivo: evitar progressão para caquexia refratária.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Caquexia Refratária',
            conteudo: Text(
              '• Expectativa de vida <3 meses.\n'
              '• Foco total no alívio de sintomas.\n'
              '• Evitar intervenções invasivas.\n'
              '• Suporte psicológico à família quanto à redução natural da '
              'ingesta alimentar.',
              style: TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
