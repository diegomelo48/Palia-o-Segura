import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class ComunicacaoMasNoticiasScreen extends StatelessWidget {
  const ComunicacaoMasNoticiasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comunicação de Más Notícias')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        children: [
          AppMenuCard(
            iconAsset: 'ic_protocolos',
            accent: AppColors.accent1,
            accentTint: AppColors.accent1Tint,
            title: 'Protocolo SPIKES',
            onTap: () => Navigator.of(context).pushNamed('/comunicacao/spikes'),
          ),
          AppMenuCard(
            iconAsset: 'ic_protocolos',
            accent: AppColors.accent2,
            accentTint: AppColors.accent2Tint,
            title: 'Protocolo VALUE',
            onTap: () => Navigator.of(context).pushNamed('/comunicacao/value'),
          ),
          AppMenuCard(
            iconAsset: 'ic_protocolos',
            accent: AppColors.accent3,
            accentTint: AppColors.accent3Tint,
            title: 'Protocolo GUIDE',
            onTap: () => Navigator.of(context).pushNamed('/comunicacao/guide'),
          ),
          AppMenuCard(
            iconAsset: 'ic_protocolos',
            accent: AppColors.accent4,
            accentTint: AppColors.accent4Tint,
            title: 'Protocolo REMEMBER',
            onTap: () => Navigator.of(context).pushNamed('/comunicacao/remap'),
          ),
          AppMenuCard(
            iconAsset: 'ic_protocolos',
            accent: AppColors.accent5,
            accentTint: AppColors.accent5Tint,
            title: 'Pontos-chave na comunicação',
            onTap: () =>
                Navigator.of(context).pushNamed('/comunicacao/pontos-chave'),
          ),
        ],
      ),
    );
  }
}
