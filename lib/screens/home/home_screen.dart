import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      children: [
        AppMenuCard(
          iconAsset: 'ic_cad1',
          accent: AppColors.accent1,
          accentTint: AppColors.accent1Tint,
          title: 'Avaliação por escalas de indicação de cuidados paliativos',
          onTap: () => Navigator.of(context).pushNamed('/escalas'),
        ),
        AppMenuCard(
          iconAsset: 'ic_cad2',
          accent: AppColors.accent2,
          accentTint: AppColors.accent2Tint,
          title: 'Controle dos principais sintomas clínicos de desconforto',
          onTap: () => Navigator.of(context).pushNamed('/controle-sintomas'),
        ),
        AppMenuCard(
          iconAsset: 'ic_cad3',
          accent: AppColors.accent3,
          accentTint: AppColors.accent3Tint,
          title: 'Embasamento ético e jurídico para os cuidados paliativos',
          onTap: () =>
              Navigator.of(context).pushNamed('/embasamento-juridico'),
        ),
        AppMenuCard(
          iconAsset: 'ic_cad4',
          accent: AppColors.accent4,
          accentTint: AppColors.accent4Tint,
          title:
              'Documentos antecipatórios de vontade pelo paciente ou familiares',
          onTap: () =>
              Navigator.of(context).pushNamed('/documentos-antecipatorios'),
        ),
        AppMenuCard(
          iconAsset: 'ic_cad5',
          accent: AppColors.accent5,
          accentTint: AppColors.accent5Tint,
          title: 'Comunicação de más notícias',
          onTap: () =>
              Navigator.of(context).pushNamed('/comunicacao-mas-noticias'),
        ),
      ],
    );
  }
}
