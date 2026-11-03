import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class ProtocoloRemapScreen extends StatelessWidget {
  const ProtocoloRemapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Protocolo REMEMBER')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'REMEMBER é um acrônimo utilizado para estruturar a '
            'comunicação de notícias difíceis e a abordagem de pacientes '
            'em fase terminal, focando na humanização, no controle de '
            'sintomas e no suporte emocional à família. Essa ferramenta '
            'faz parte dos cuidados paliativos, que visam proporcionar '
            'qualidade de vida e dignidade no fim da vida.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          const AppInfoSubCard(
            title: 'R – Reação',
            description:
                'Avaliar a reação do paciente e da família ao receberem '
                'informações difíceis.',
          ),
          const AppInfoSubCard(
            title: 'E – Emoção',
            description:
                'Nomear, validar e dar espaço para as emoções (tristeza, '
                'raiva, negação, medo).',
          ),
          const AppInfoSubCard(
            title: 'M – Memória',
            description:
                'Estimular a partilha de memórias significativas e '
                'histórias de vida.',
          ),
          const AppInfoSubCard(
            title: 'E – Empatia',
            description:
                'Expressar compreensão e compaixão pela dor e sofrimento '
                'do paciente.',
          ),
          const AppInfoSubCard(
            title: 'M – Manejo',
            description:
                'Controlar os sintomas físicos e psicológicos de forma '
                'ágil e eficaz.',
          ),
          const AppInfoSubCard(
            title: 'B – Boas notícias (focar no conforto)',
            description:
                'Mesmo em cenários ruins, focar no que pode ser feito para '
                'o conforto (ex: "ele não está sentindo dor").',
          ),
          const AppInfoSubCard(
            title: 'E – Escuta ativa',
            description:
                'Ouvir atentamente, sem interromper, permitindo que o '
                'paciente fale sobre seus medos.',
          ),
          const AppInfoSubCard(
            title: 'R – Respeito',
            description:
                'Respeitar o tempo, a autonomia e as decisões do paciente '
                'e familiares.',
          ),
        ],
      ),
    );
  }
}
