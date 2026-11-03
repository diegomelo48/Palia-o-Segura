import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class ProtocoloGuideScreen extends StatelessWidget {
  const ProtocoloGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Protocolo GUIDE')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'Embora muitas vezes confundido ou associado ao protocolo '
            'SPIKES, o GUIDE oferece um roteiro estruturado para guiar a '
            'conversa. Aqui estão as etapas do protocolo GUIDE, focadas na '
            'comunicação de prognóstico e decisões difíceis:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          const AppInfoSubCard(
            title: 'G – Get ready (Prepare-se)',
            description:
                'Reúna as informações clínicas necessárias, escolha um '
                'ambiente privado, minimize interrupções e identifique '
                'quem deve participar da conversa.',
          ),
          const AppInfoSubCard(
            title:
                'U – Understand what the patient knows (Entenda o que o '
                'paciente sabe)',
            description:
                'Explore o entendimento atual do paciente sobre sua '
                'condição e o que já lhe foi comunicado.',
          ),
          const AppInfoSubCard(
            title: 'I – Inform (Informe)',
            description:
                'Comunique a informação de maneira clara, direta e '
                'compreensível, evitando jargões. Apresente inicialmente a '
                'informação principal e dê tempo para que o paciente a '
                'processe.',
          ),
          const AppInfoSubCard(
            title: 'D – Demonstrate empathy (Demonstre empatia)',
            description:
                'Reconheça e responda às emoções do paciente e de seus '
                'familiares. Utilize silêncio e validação emocional quando '
                'apropriado.',
          ),
          const AppInfoSubCard(
            title: 'E – Equip for the next step (Prepare para os próximos '
                'passos)',
            description:
                'Explique o que acontecerá a seguir, esclareça dúvidas e '
                'ajude o paciente e a família a compreender as opções e os '
                'próximos passos do cuidado.',
          ),
        ],
      ),
    );
  }
}
