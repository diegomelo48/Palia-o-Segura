import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/accordion_section.dart';

class ProtocoloSpikesScreen extends StatelessWidget {
  const ProtocoloSpikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Protocolo SPIKES')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'Fluxo organizado em seis quadros, integrando diretrizes '
            'técnicas com os desafios práticos.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          const AccordionSection(
            titulo: 'Passo 1: S - Setting Up (Preparando o encontro)',
            conteudo: Text(
              'Este momento descreve a preparação prévia do médico e do '
              'ambiente físico para garantir privacidade e conforto.\n\n'
              'Ambiente físico:\nEscolher um local privativo, com assentos '
              'para todos os participantes, evitando barreiras físicas '
              'entre o médico e o paciente.\n\n'
              'Preparação mental:\nRevisar todos os detalhes do caso '
              '(diagnóstico e prognóstico) e preparar-se emocionalmente '
              'para a interação.\n\n'
              'Gerenciamento de interrupções:\nColocar o celular no '
              'silencioso e informar à equipe que não deve ser '
              'interrompido, salvo em emergências extremas.\n\n'
              'Apoio social:\nVerificar se o paciente deseja a presença de '
              'familiares ou acompanhantes para suporte emocional.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Passo 2: P - Perception (O que o paciente sabe?)',
            conteudo: Text(
              'Momento de escuta ativa para avaliar o quanto o paciente e '
              'a família compreendem a situação clínica.\n\n'
              'Escuta ativa:\nUtilizar perguntas abertas como "O que o '
              'senhor entendeu da sua situação até agora?" ou "O que já '
              'lhe falaram?".\n\n'
              'Alinhamento de expectativas:\nIdentificar lacunas entre a '
              'realidade clínica e o que o paciente acredita.\n\n'
              'Linguagem adaptativa:\nAjustar o nível do vocabulário com '
              'base no que o paciente demonstra compreender.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Passo 3: I - Invitation (O quanto o paciente quer saber?)',
            conteudo: Text(
              'Busca respeitar o limite e a autonomia do paciente.\n\n'
              'Verificação do desejo:\nPerguntar diretamente se o paciente '
              'deseja saber todos os detalhes.\n\n'
              'Respeito aos limites:\nCaso o paciente não queira receber '
              'informações naquele momento, garantir continuidade do '
              'cuidado.\n\n'
              'Diretivas antecipadas:\nPode abrir espaço para discutir '
              'desejos de fim de vida em casos de prognóstico reservado.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Passo 4: K - Knowledge (Transmitindo a informação)',
            conteudo: Text(
              'Comunicação clara e honesta da má notícia.\n\n'
              'Técnica de introdução:\nUtilizar frases de alerta como '
              '"Infelizmente, o que tenho para dizer não é bom".\n\n'
              'Linguagem acessível:\nEvitar jargões técnicos.\n\n'
              'Dosagem da notícia:\nTransmitir informações em pequenas '
              'partes, checando a compreensão.\n\n'
              'Expressões a evitar:\nNunca dizer "Não há mais nada a '
              'fazer".',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Passo 5: E - Emotions (Acolhendo as emoções)',
            conteudo: Text(
              'Fase dedicada à empatia.\n\n'
              'Reconhecimento:\nIdentificar emoções por comunicação verbal '
              'e não verbal.\n\n'
              'Validação:\nReforçar que a reação é normal.\n\n'
              'Resposta empática:\nUtilizar silêncio terapêutico e toque '
              'se apropriado.\n\n'
              'Suporte interdisciplinar:\nConsiderar apoio psicológico.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo:
                'Passo 6: S - Strategy and Summary (Estratégia e Resumo)',
            conteudo: Text(
              'Etapa final para resumir o que foi dito.\n\n'
              'Síntese dos pontos:\nRevisar informações e esclarecer '
              'dúvidas.\n\n'
              'Plano de conduta:\nDefinir estratégias para controle de '
              'sintomas.\n\n'
              'Garantia de assistência:\nAssegurar que o paciente não será '
              'abandonado.\n\n'
              'Disponibilidade:\nManter canais abertos para novas '
              'conversas.',
              style: TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
