import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class ProtocoloValueScreen extends StatelessWidget {
  const ProtocoloValueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Protocolo VALUE')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'O acrônimo VALUE representa cinco passos essenciais para '
            'conferências familiares eficazes:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          const AppInfoSubCard(
            title: 'V – Value (Valorizar)',
            description:
                'Valorizar as afirmações feitas pela família. Reconhecer '
                'suas preocupações, sentimentos e a importância de suas '
                'declarações.',
          ),
          const AppInfoSubCard(
            title: 'A – Acknowledge (Reconhecer / Acolher)',
            description:
                'Reconhecer as emoções da família. Validar sentimentos de '
                'medo, tristeza ou raiva, demonstrando empatia e '
                'disponibilidade.',
          ),
          const AppInfoSubCard(
            title: 'L – Listen (Ouvir)',
            description:
                'Ouvir ativamente. Dar tempo para a família falar sem '
                'interrupções, permitindo que expressem suas angústias e '
                'dúvidas.',
          ),
          const AppInfoSubCard(
            title: 'U – Understand (Compreender)',
            description:
                'Compreender o paciente como pessoa. Fazer perguntas sobre '
                'quem é o paciente fora da UTI (hobbies, personalidade, '
                'valores) para humanizar o cuidado.',
          ),
          const AppInfoSubCard(
            title: 'E – Elicit (Elucidar / Perguntar)',
            description:
                'Elucidar perguntas da família. Encorajar os familiares a '
                'fazerem perguntas, garantindo que todas as dúvidas sobre o '
                'tratamento e prognóstico sejam esclarecidas.',
          ),
        ],
      ),
    );
  }
}
