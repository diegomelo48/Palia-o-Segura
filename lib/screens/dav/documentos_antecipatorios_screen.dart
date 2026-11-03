import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class DocumentosAntecipatoriosScreen extends StatelessWidget {
  const DocumentosAntecipatoriosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Documentos Antecipatórios')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        children: [
          AppMenuCard(
            iconAsset: 'ic_diretivas',
            accent: AppColors.accent2,
            accentTint: AppColors.accent2Tint,
            title: 'Diretivas antecipadas de vontade (DAV)',
            onTap: () => Navigator.of(context).pushNamed('/dav/dav'),
          ),
          AppMenuCard(
            iconAsset: 'ic_diretivas',
            accent: AppColors.accent2,
            accentTint: AppColors.accent2Tint,
            title: 'O que é importante para mim',
            onTap: () => Navigator.of(context).pushNamed('/dav/importante'),
          ),
        ],
      ),
    );
  }
}
