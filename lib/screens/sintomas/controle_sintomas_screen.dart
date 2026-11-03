import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class ControleSintomasScreen extends StatelessWidget {
  const ControleSintomasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controle de Sintomas')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        children: [
          AppMenuCard(
            iconAsset: 'ic_controle1',
            accent: AppColors.accent1,
            accentTint: AppColors.accent1Tint,
            title: 'Controle da dor',
            onTap: () => Navigator.of(context).pushNamed('/sintomas/dor'),
          ),
          AppMenuCard(
            iconAsset: 'ic_controle2',
            accent: AppColors.accent2,
            accentTint: AppColors.accent2Tint,
            title: 'Controle da dispneia',
            onTap: () => Navigator.of(context).pushNamed('/sintomas/dispneia'),
          ),
          AppMenuCard(
            iconAsset: 'ic_controle3',
            accent: AppColors.accent3,
            accentTint: AppColors.accent3Tint,
            title: 'Controle das Náuseas e Vômitos',
            onTap: () => Navigator.of(context).pushNamed('/sintomas/nauseas'),
          ),
          AppMenuCard(
            iconAsset: 'ic_controle4',
            accent: AppColors.accent4,
            accentTint: AppColors.accent4Tint,
            title: 'Controle da Fadiga',
            onTap: () => Navigator.of(context).pushNamed('/sintomas/fadiga'),
          ),
          AppMenuCard(
            iconAsset: 'ic_controle5',
            accent: AppColors.accent5,
            accentTint: AppColors.accent5Tint,
            title: 'Outros Controles Importantes',
            onTap: () => Navigator.of(context).pushNamed('/sintomas/outros'),
          ),
        ],
      ),
    );
  }
}
