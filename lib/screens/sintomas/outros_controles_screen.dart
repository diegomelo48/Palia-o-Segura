import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class OutrosControlesScreen extends StatelessWidget {
  const OutrosControlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Outros Controles')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'Descrição e Conduta',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hipodermóclise',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.primary)),
                  const SizedBox(height: AppSpacing.xs),
                  const Text(
                    'Via segura e simples para domicílio. Butterfly '
                    '(cateter agulhado) dura 5-7 dias; Abocath/Intima dura '
                    '7-15 dias. Permite misturar até 3-4 drogas '
                    'compatíveis.',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Agitação Terminal',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.primary)),
                  const SizedBox(height: AppSpacing.xs),
                  const Text(
                    'Delírio nas últimas horas de vida. Manejo: Ambiente '
                    'calmo e cuidado 1:1. Drogas: Clorpromazina (leve), '
                    'Midazolam (moderada) ou associação de ambos '
                    '(intensa).',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Convulsões',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.primary)),
                  const SizedBox(height: AppSpacing.xs),
                  const Text(
                    'Estabilização: Midazolam (IV/SC 0,2mg/kg) ou Diazepam '
                    '(IV/VR). Tratar causas reversíveis como hipoglicemia.',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
