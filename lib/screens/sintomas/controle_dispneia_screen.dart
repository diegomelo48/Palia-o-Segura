import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/accordion_section.dart';

class ControleDispneiaScreen extends StatelessWidget {
  const ControleDispneiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controle da Dispneia')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'A dispneia é uma percepção subjetiva. A oximetria de pulso não '
            'deve ser o único parâmetro para definir a conduta.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          const AccordionSection(
            titulo: 'Avaliação Inicial e Escalas',
            conteudo: Text(
              '• Avaliar impacto na fala e esforço respiratório.\n'
              '• Buscar causas reversíveis: anemia, infecção, arritmia ou '
              'derrame pleural.\n'
              '• Avaliar se o objetivo é conforto ou prolongamento da vida.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Medidas Não Medicamentosas',
            conteudo: Text(
              '• Uso de ventilador portátil ou de rosto.\n'
              '• Abrir janelas.\n'
              '• Elevação da cabeceira.\n'
              '• Respiração com lábios franzidos.\n'
              '• Posicionamento confortável.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Medidas Medicamentosas',
            conteudo: Text(
              'Morfina:\n'
              '• Padrão-ouro para dispneia.\n'
              '• Dose: 1–5 mg EV ou SC.\n\n'
              'Ansiolíticos:\n'
              '• Midazolam ou Diazepam se ansiedade.\n\n'
              'Esteroides:\n'
              '• Dexametasona em obstrução tumoral.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Estertores (Agonia)',
            conteudo: Text(
              '• Hioscina 10–20 mg.\n'
              '• Atropina colírio SL.\n\n'
              'Objetivo: reduzir secreções.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Oxigenioterapia',
            conteudo: Text(
              '• Indicada se SatO₂ <92%.\n'
              '• Pode ser usada por conforto psicológico.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Ambiente Hospitalar vs. Domiciliar',
            conteudo: Text(
              'Hospitalar:\n'
              '• Morfina EV ou SC.\n'
              '• Oxigênio se indicado.\n\n'
              'Domiciliar:\n'
              '• Medidas ambientais.\n'
              '• Morfina VO ou SC contínua.',
              style: TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
