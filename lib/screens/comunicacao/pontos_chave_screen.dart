import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class PontosChaveScreen extends StatelessWidget {
  const PontosChaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pontos-Chave')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: const [
          AppInfoSubCard(
            title: 'Abordagem Multidisciplinar',
            description:
                'A comunicação deve ser feita por uma equipe preparada '
                'para lidar com o impacto emocional.',
          ),
          AppInfoSubCard(
            title: 'Humanização',
            description:
                'O objetivo é oferecer uma morte sem sofrimento, focada no '
                'paciente e não apenas na doença.',
          ),
          AppInfoSubCard(
            title: 'Família',
            description:
                'A família é incluída na unidade de cuidado e precisa de '
                'suporte no luto.',
          ),
          AppInfoSubCard(
            title: 'Ortotanásia',
            description:
                'Defesa da morte natural, sem tratamentos fúteis que '
                'prolonguem o sofrimento.',
          ),
        ],
      ),
    );
  }
}
