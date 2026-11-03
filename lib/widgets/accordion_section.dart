import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Seção expansível (título clicável + conteúdo), equivalente ao padrão
/// "configurarToggle / configurarAccordion" repetido em várias Activities
/// nativas (ControleDorActivity, ControleDispneiaActivity, DAVActivity,
/// ProtocoloSpikesActivity etc).
class AccordionSection extends StatefulWidget {
  final String titulo;
  final Widget conteudo;
  final bool inicialmenteAberto;

  const AccordionSection({
    super.key,
    required this.titulo,
    required this.conteudo,
    this.inicialmenteAberto = false,
  });

  @override
  State<AccordionSection> createState() => _AccordionSectionState();
}

class _AccordionSectionState extends State<AccordionSection> {
  late bool _aberto = widget.inicialmenteAberto;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
            onTap: () => setState(() => _aberto = !_aberto),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.titulo,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Icon(
                    _aberto
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                0,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: widget.conteudo,
            ),
            crossFadeState:
                _aberto ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}

/// Texto simples usado dentro do conteúdo de uma AccordionSection.
/// TODO(Diego): substituir pelo texto clínico real de cada seção —
/// o mesmo conteúdo que já existe nos XML originais (não veio no
/// código Java, só a estrutura dos títulos/ids).
class AccordionPlaceholderText extends StatelessWidget {
  final String nota;
  const AccordionPlaceholderText({super.key, this.nota = 'Conteúdo a portar do XML original.'});

  @override
  Widget build(BuildContext context) {
    return Text(
      nota,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: AppColors.textSecondary, fontStyle: FontStyle.italic),
    );
  }
}
