import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/accordion_section.dart';

class ControleNauseasScreen extends StatelessWidget {
  const ControleNauseasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controle das Náuseas e Vômitos')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'A escolha do antiemético deve ser baseada na causa provável da '
            'náusea e do vômito (química, gástrica ou central).',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          const AccordionSection(
            titulo: 'Avaliação e Causas',
            conteudo: Text(
              '• Diferenciar estase gástrica, obstrução intestinal ou '
              'causas metabólicas (uremia, hipercalcemia).\n'
              '• Avaliar causas químicas (drogas, insuficiência renal).\n'
              '• Considerar aumento da pressão intracraniana (PIC).',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Medidas Não Medicamentosas',
            conteudo: Text(
              '• Refeições pequenas e fracionadas.\n'
              '• Oferecer alimentos frios ou em temperatura ambiente.\n'
              '• Evitar odores fortes.\n'
              '• Manter higiene oral rigorosa.\n'
              '• Adaptação do cardápio familiar.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Medidas Medicamentosas',
            conteudo: Text(
              'Procinéticos:\n'
              '• Metoclopramida ou Domperidona para estase gástrica.\n\n'
              'Antagonistas de Dopamina:\n'
              '• Haloperidol para causas químicas (drogas, uremia).\n\n'
              'Outros:\n'
              '• Dimenidrinato para causas vestibulares/tontura.\n'
              '• Ondansetrona para náuseas induzidas por quimioterapia.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Situações Específicas e Diferenciais',
            conteudo: Text(
              '• Náuseas refratárias ou associadas à quimioterapia: '
              'Olanzapina.\n'
              '• Cinetose / Vestibular: Dimenidrinato.\n'
              '• Aumento da pressão intracraniana: Dexametasona.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Ambiente Hospitalar vs. Domiciliar',
            conteudo: Text(
              'Hospitalar:\n'
              '• Considerar antieméticos em infusão contínua subcutânea '
              '(hipodermóclise) se sintomas persistirem ou via oral estiver '
              'impedida.\n\n'
              'Domiciliar:\n'
              '• Priorizar via oral.\n'
              '• Utilizar via retal (supositórios) se a via oral não for '
              'possível.\n'
              '• Ajustar o cardápio conforme tolerância do paciente.',
              style: TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
