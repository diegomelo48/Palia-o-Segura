import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/accordion_section.dart';

class DavScreen extends StatefulWidget {
  const DavScreen({super.key});

  @override
  State<DavScreen> createState() => _DavScreenState();
}

class _DavScreenState extends State<DavScreen> {
  bool? _autonomiaPreservada;

  void _mostrarDialog(String titulo, String mensagem) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(String titulo) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        title: Text(titulo, style: const TextStyle(color: AppColors.primary)),
        trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
        onTap: () {
          switch (titulo) {
            case 'Testamento Vital (DAV)':
              _mostrarDialog(
                'Testamento Vital (DAV)',
                'Recusa de IOT, RCP, ventilação mecânica e nutrição/'
                    'hidratação artificial.\n\nBase Legal:\nResolução CFM '
                    '1.995/2012.\n\nPode ser revogado a qualquer momento.',
              );
              break;
            case 'Mandato Duradouro (Procurador)':
              _mostrarDialog(
                'Mandato Duradouro',
                'Nomeação de procurador para decisões em incapacidade.\n\n'
                    'Base Legal:\nResolução CFM 1.995/2012.',
              );
              break;
            case 'Plano de Ortotanásia e Conforto':
              _mostrarDialog(
                'Plano de Ortotanásia',
                'Suspensão de tratamentos fúteis com foco em conforto e '
                    'sedação paliativa.\n\nBase Legal:\nResolução CFM '
                    '1.805/2006.',
              );
              break;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DAV')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'Fluxograma de Decisão Clínica',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.md),

          // Etapa 1
          Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Avaliação Clínica',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.primary)),
                  const SizedBox(height: AppSpacing.xs),
                  const Text(
                    'Identificar terminalidade, doença incurável, avançada '
                    'e progressiva. Diferenciar Ortotanásia de Distanásia.',
                  ),
                ],
              ),
            ),
          ),

          // Etapa 2 - autonomia
          Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2. Verificação de Autonomia',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.primary)),
                  const SizedBox(height: AppSpacing.sm),
                  Text('O paciente está lúcido e capaz?',
                      style: const TextStyle(color: AppColors.primary)),
                  RadioListTile<bool>(
                    value: true,
                    groupValue: _autonomiaPreservada,
                    title: const Text('Sim – colher vontade atual'),
                    contentPadding: EdgeInsets.zero,
                    activeColor: AppColors.secondary,
                    onChanged: (v) {
                      setState(() => _autonomiaPreservada = v);
                      _mostrarDialog(
                        'Autonomia Preservada',
                        'A vontade atual do paciente deve ser colhida e '
                            'respeitada.',
                      );
                    },
                  ),
                  RadioListTile<bool>(
                    value: false,
                    groupValue: _autonomiaPreservada,
                    title: const Text('Não – buscar DAVs'),
                    contentPadding: EdgeInsets.zero,
                    activeColor: AppColors.secondary,
                    onChanged: (v) {
                      setState(() => _autonomiaPreservada = v);
                      _mostrarDialog(
                        'Autonomia Comprometida',
                        'Buscar DAVs, autocuratela ou representante legal.',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Alerta
          Card(
            color: const Color(0xFFFFF3CD),
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: const Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Text(
                '⚠️ A vontade registrada no prontuário é suficiente para '
                'aplicação imediata no ambiente hospitalar.',
              ),
            ),
          ),

          // Etapa 3
          Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('3. Consulta de Registros',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.primary)),
                  const SizedBox(height: AppSpacing.xs),
                  const Text(
                    'Consultar prontuário, DAVs e CENSEC para autocuratela '
                    'ou diretivas antecipadas.',
                  ),
                ],
              ),
            ),
          ),

          _infoCard('Testamento Vital (DAV)'),
          _infoCard('Mandato Duradouro (Procurador)'),
          _infoCard('Plano de Ortotanásia e Conforto'),

          const SizedBox(height: AppSpacing.md),
          Text(
            'O que avaliar para criar uma DAV',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),

          const AccordionSection(
            titulo: '1. Autonomia do paciente',
            conteudo: Text(
              '● Expressão prévia e consciente da vontade do paciente.\n'
              '● Deve prevalecer mesmo quando o paciente perde a capacidade '
              'decisória.\n'
              '● Base ética central: respeito à dignidade e à '
              'autodeterminação.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: '2. Capacidade e voluntariedade',
            conteudo: Text(
              '● A DAV deve ser elaborada quando o paciente está:\n'
              '○ lúcido,\n○ orientado,\n○ livre de coerção.\n'
              '● Não exige avaliação psiquiátrica formal, mas capacidade '
              'deve ser presumida.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: '3. Conteúdo da DAV',
            conteudo: Text(
              'Pode incluir, de forma clara:\n'
              'a) Limitação ou recusa de tratamentos\n'
              '● Ventilação mecânica invasiva\n'
              '● Reanimação cardiopulmonar (DNR/DNAR)\n'
              '● Hemodiálise\n'
              '● Nutrição e hidratação artificiais\n'
              '● Uso de drogas vasoativas\n\n'
              'b) Prioridades de cuidado\n'
              '● Conforto e alívio de sintomas\n'
              '● Preferência por cuidados paliativos\n'
              '● Local de cuidado/morte (quando aplicável)\n\n'
              'c) Valores e crenças\n'
              '● Espirituais, religiosas, culturais\n'
              '● O que o paciente considera qualidade de vida aceitável',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: '4. Nomeação de representante (procurador de saúde)',
            conteudo: Text(
              '● Pessoa de confiança para decidir quando a DAV não '
              'contemplar o cenário clínico.\n'
              '● Fundamental em situações complexas de UTI.\n'
              '● Deve conhecer bem os valores do paciente.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: '5. Forma e registro',
            conteudo: Text(
              '● Pode ser:\n○ escrita,\n○ verbal (registrada em '
              'prontuário),\n○ documento particular.\n'
              '● Não exige cartório, mas o registro formal aumenta '
              'segurança jurídica.\n'
              '● Deve estar claramente documentada no prontuário e '
              'acessível à equipe.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: '6. Atualização e revogabilidade',
            conteudo: Text(
              '● A DAV pode ser:\n○ modificada,\n○ atualizada,\n'
              '○ revogada\na qualquer momento, enquanto houver capacidade.\n'
              '● Mudanças clínicas importantes → revisitar a DAV.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: '7. Limites éticos e legais',
            conteudo: Text(
              '● A DAV:\n○ ❌ não autoriza eutanásia ou suicídio assistido '
              '(ilegal no Brasil)\n'
              '○ ✅ permite limitação ou suspensão de tratamentos fúteis ou '
              'desproporcionais\n'
              '● Deve estar alinhada à boa prática médica e ao Código de '
              'Ética.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: '8. Conflitos com familiares',
            conteudo: Text(
              '● A vontade expressa do paciente prevalece sobre a opinião '
              'da família.\n'
              '● Comunicação clara e registro adequado reduzem '
              'judicialização.\n'
              '● Comissão de ética hospitalar pode ser acionada em '
              'conflitos persistentes.',
              style: TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
