import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class EscalasScreen extends StatelessWidget {
  const EscalasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escalas')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        children: [
          AppMenuCard(
            iconAsset: 'ic_ecog',
            accent: AppColors.accent1,
            accentTint: AppColors.accent1Tint,
            title: 'Escala ECOG',
            onTap: () => Navigator.of(context).pushNamed('/escalas/ecog'),
          ),
          AppMenuCard(
            iconAsset: 'ic_pps',
            accent: AppColors.accent2,
            accentTint: AppColors.accent2Tint,
            title: 'Escala PPS',
            onTap: () => Navigator.of(context).pushNamed('/escalas/pps'),
          ),
          AppMenuCard(
            iconAsset: 'ic_kps',
            accent: AppColors.accent3,
            accentTint: AppColors.accent3Tint,
            title: 'Escala KPS',
            onTap: () => Navigator.of(context).pushNamed('/escalas/kps'),
          ),
          AppMenuCard(
            iconAsset: 'ic_ppi',
            accent: AppColors.accent4,
            accentTint: AppColors.accent4Tint,
            title: 'Escala PPI',
            onTap: () => Navigator.of(context).pushNamed('/escalas/ppi'),
          ),
          AppMenuCard(
            iconAsset: 'ic_spict',
            accent: AppColors.accent5,
            accentTint: AppColors.accent5Tint,
            title: 'Escala Spict',
            onTap: () => Navigator.of(context).pushNamed('/escalas/spict'),
          ),
          AppMenuCard(
            iconAsset: 'ic_necpal',
            accent: AppColors.accent1,
            accentTint: AppColors.accent1Tint,
            title: 'Escala Necpal-BR',
            onTap: () => Navigator.of(context).pushNamed('/escalas/necpal'),
          ),
        ],
      ),
    );
  }
}
