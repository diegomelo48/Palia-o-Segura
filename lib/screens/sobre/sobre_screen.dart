import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_icon.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const SizedBox(height: AppSpacing.sm),
        const AppIcon('icone', size: 140),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Security Palli',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: AppColors.primary, fontSize: 22),
        ),
        const Text(
          '©Copyright - 2025 - 2026',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontStyle: FontStyle.italic,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sobre o Aplicativo',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.secondary),
                ),
                const SizedBox(height: AppSpacing.xs),
                const Text(
                  'Produto educacional do Programa de Pós Graduação '
                  'Mestrado em Saúde da Amazônia da Universidade Federal '
                  'do Pará',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Objetivos do Aplicativo',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.secondary),
                ),
                const SizedBox(height: AppSpacing.xs),
                const Text(
                  'Ser um recurso digital capaz de orientar o médico '
                  'intensivista, emergencista e paliativista, de uma forma '
                  'simples e segura, sobre a tomada de decisão frente a '
                  'pacientes com indicação de cuidados paliativos',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Público-alvo',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.secondary),
                ),
                const SizedBox(height: AppSpacing.xs),
                const Text(
                  'Profissionais médicos que atuem diretamente com '
                  'pacientes criticamente enfermos em condições de serem '
                  'avaliados sobre a indicação de cuidados paliativos, '
                  'como médicos intensivistas, médicos emergencistas e '
                  'médicos paliativistas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
