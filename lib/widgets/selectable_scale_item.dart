import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Item de lista selecionável — equivalente ao destacarItem() usado em
/// EscalasEcogActivity, EscalasKPSActivity e EscalasPPSActivity: ao tocar,
/// o item fica destacado (verde) e os demais voltam ao normal.
class SelectableScaleItem extends StatelessWidget {
  final String texto;
  final bool selecionado;
  final VoidCallback onTap;

  const SelectableScaleItem({
    super.key,
    required this.texto,
    required this.selecionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusInput),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: AppSpacing.xs),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm + 4,
        ),
        decoration: BoxDecoration(
          color: selecionado ? AppColors.secondaryLight : Colors.transparent,
          border: Border.all(
            color: selecionado ? AppColors.secondary : AppColors.divider,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.radiusInput),
        ),
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 15,
            color: selecionado ? AppColors.textPrimary : AppColors.textSecondary,
            fontWeight: selecionado ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

/// Card com o resultado calculado de uma escala (PPI, NECPAL, SPICT).
class ScaleResultCard extends StatelessWidget {
  final String texto;
  const ScaleResultCard({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    if (texto.isEmpty) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Text(
        texto,
        style: const TextStyle(color: AppColors.textPrimary, fontSize: 15, height: 1.4),
      ),
    );
  }
}
