import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'pdf_viewer_screen.dart';

class _DocumentoJuridico {
  final String titulo;
  final String arquivo;
  final String iconAsset;
  const _DocumentoJuridico(this.titulo, this.arquivo, this.iconAsset);
}

// Mesmos 5 documentos, nomes de arquivo e ícones do app nativo
// (EmbasamentoJuridicoActivity.java + activity_embasamento_juridico.xml).
const _documentos = [
  _DocumentoJuridico(
    'Portaria GM/MS n 3681 de 7 de Maio de 2024',
    'Portoria GM-MS n 3681 de 7 de maio de 2024.pdf',
    'ic_resolucoes',
  ),
  _DocumentoJuridico(
    'Lei nº 14.758, de 19 de Dezembro de 2023',
    'Lei nº 14.758, de 19 de dezembro de 2023.pdf',
    'ic_lei',
  ),
  _DocumentoJuridico(
    'Resolução nº 41, de 31 de Outubro de 2018, do Ministério da Saúde',
    'Resolução nº 41, de 31 de outubro de 2018, do Ministério da Saúde.pdf',
    'ic_resolucoes',
  ),
  _DocumentoJuridico(
    'Resolução CFM nº 355/2022, do Ministério da Saúde',
    'Resolução nº 355, de 23 de agosto de 2022, do Conselho Regional de Medicina de São Paulo.pdf',
    'ic_resolucoes',
  ),
  _DocumentoJuridico(
    'Resolução nº 1.805/06 do Conselho Federal de Medicina',
    'Resolução nº 1.805-06 do Conselho Federal de Medicina.pdf',
    'ic_resolucoes',
  ),
];

class EmbasamentoJuridicoScreen extends StatelessWidget {
  const EmbasamentoJuridicoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Embasamento Jurídico')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        children: [
          for (final doc in _documentos)
            AppMenuCard(
              iconAsset: doc.iconAsset,
              accent: AppColors.accent3,
              accentTint: AppColors.accent3Tint,
              title: doc.titulo,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PdfViewerScreen(
                    titulo: doc.titulo,
                    nomeArquivo: doc.arquivo,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
