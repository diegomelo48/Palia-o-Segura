import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'app_icon.dart';

/// Botão primário padrão do app.
class AppPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;

  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      child: loading
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.4,
                color: AppColors.textOnPrimary,
              ),
            )
          : Text(label),
    );
  }
}

/// Campo de texto padrão do app (contorno, ícone opcional).
class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: AppColors.textPrimary, fontSize: 16),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null
            ? Icon(icon, color: AppColors.textSecondary)
            : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

/// Sub-card simples (título + descrição), usado nos protocolos VALUE,
/// GUIDE, REMEMBER e na tela de Pontos-chave.
class AppInfoSubCard extends StatelessWidget {
  final String title;
  final String description;

  const AppInfoSubCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              description,
              style: const TextStyle(height: 1.4, color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

/// Item de menu da Home: card branco com badge de ícone colorido,
/// substituindo os antigos cards com fundo sólido saturado.
///
/// [iconAsset] é o nome do drawable original SEM extensão (ex: "ic_cad1"),
/// carregado de assets/icons/. Veja app_icon.dart.
class AppMenuCard extends StatelessWidget {
  final String iconAsset;
  final Color accent;
  final Color accentTint;
  final String title;
  final VoidCallback onTap;

  const AppMenuCard({
    super.key,
    required this.iconAsset,
    required this.accent,
    required this.accentTint,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm / 2,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        onTap: onTap,
        child: Container(
          height: AppSpacing.cardHomeHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            children: [
              Container(
                width: AppSpacing.badgeSize,
                height: AppSpacing.badgeSize,
                decoration: BoxDecoration(
                  color: accentTint,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: AppIcon(iconAsset, size: AppSpacing.iconSize, color: accent),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
