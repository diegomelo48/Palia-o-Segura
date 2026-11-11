import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_icon.dart';
import 'pdf_viewer_screen.dart';

class _DocumentoJuridico {
  final String titulo;
  final String descricao;
  final String arquivo;
  final String iconAsset;
  const _DocumentoJuridico({
    required this.titulo,
    required this.descricao,
    required this.arquivo,
    required this.iconAsset,
  });
}

// Mesmos 5 documentos, nomes de arquivo e ícones do app nativo
// (EmbasamentoJuridicoActivity.java + activity_embasamento_juridico.xml).
const _documentos = [
  _DocumentoJuridico(
    titulo: 'Portaria GM/MS n 3681 de 7 de Maio de 2024',
    descricao:
        'Portaria GM/MS nº 3.681, de 7 de maio de 2024. Institui a Política '
        'Nacional de Cuidados Paliativos no SUS. Prevê oferta precoce, '
        'integrada ao tratamento da doença e presente em toda a rede de '
        'atenção. Prioriza alívio do sofrimento físico, psicoemocional, '
        'social e espiritual, com apoio à família e ao luto. Valoriza '
        'autonomia, diretivas antecipadas de vontade, comunicação empática e '
        'atuação multiprofissional. Prevê apoio de equipes matriciais e '
        'assistenciais, formação profissional e acesso a medicamentos para '
        'controle de sintomas.',
    arquivo: 'Portoria GM-MS n 3681 de 7 de maio de 2024.pdf',
    iconAsset: 'ic_resolucoes',
  ),
  _DocumentoJuridico(
    titulo: 'Lei nº 14.758, de 19 de Dezembro de 2023',
    descricao:
        'Lei nº 14.758, de 19 de dezembro de 2023. Institui a Política '
        'Nacional de Prevenção e Controle do Câncer e o Programa Nacional de '
        'Navegação da Pessoa com Diagnóstico de Câncer. Inclui expressamente '
        'os cuidados paliativos no cuidado integral oncológico, juntamente '
        'com prevenção, diagnóstico, tratamento e reabilitação. Prevê apoio '
        'psicológico ao paciente e aos familiares, oferta oportuna e '
        'continuidade assistencial. Determina atendimento multiprofissional, '
        'adequado ao nível de atenção e à evolução da doença, visando '
        'melhorar a qualidade de vida.',
    arquivo: 'Lei nº 14.758, de 19 de dezembro de 2023.pdf',
    iconAsset: 'ic_lei',
  ),
  _DocumentoJuridico(
    titulo: 'Resolução nº 41, de 31 de Outubro de 2018, do Ministério da Saúde',
    descricao:
        'Resolução CIT nº 41, de 31 de outubro de 2018. Estabelece diretrizes '
        'para organizar os cuidados paliativos no SUS. Considera elegível '
        'toda pessoa com doença ameaçadora da vida, aguda ou crônica, desde '
        'o diagnóstico. Recomenda início precoce, associado ao tratamento '
        'modificador da doença, com controle de sintomas e suporte '
        'psicossocial e espiritual. Defende autonomia, diretivas '
        'antecipadas de vontade, comunicação empática e apoio ao luto. '
        'Prevê oferta em todos os níveis de atenção, educação profissional e '
        'acesso a medicamentos, inclusive opioides.',
    arquivo: 'Resolução nº 41, de 31 de outubro de 2018, do Ministério da Saúde.pdf',
    iconAsset: 'ic_resolucoes',
  ),
  _DocumentoJuridico(
    titulo: 'Resolução CREMESP n° 355 de 23 de agosto de 2022',
    descricao:
        'Resolução CREMESP nº 355, de 23 de agosto de 2022. Orienta decisões '
        'sobre cuidados no fim da vida no âmbito paulista. Determina que '
        'tratamentos fúteis não sejam realizados, com esclarecimento e '
        'registro em prontuário; para tratamentos potencialmente '
        'inapropriados, exige decisão compartilhada e consenso para sua '
        'contraindicação. A retirada de suporte artificial de vida requer '
        'terminalidade confirmada pelo médico responsável e outros dois '
        'médicos, sendo um especialista na doença e outro atuante em '
        'cuidados paliativos. Exige concordância técnica, respeito à '
        'vontade do paciente ou representante e manutenção ou intensificação '
        'do conforto.',
    arquivo:
        'Resolução nº 355, de 23 de agosto de 2022, do Conselho Regional de Medicina de São Paulo.pdf',
    iconAsset: 'ic_resolucoes',
  ),
  _DocumentoJuridico(
    titulo: 'Resolução nº 1.805/06 do Conselho Federal de Medicina',
    descricao:
        'Resolução CFM nº 1.805, de 9 de novembro de 2006. Permite limitar ou '
        'suspender procedimentos e tratamentos que prolonguem a vida na fase '
        'terminal de doença grave e incurável, respeitando a vontade do '
        'paciente ou de seu representante legal. Exige esclarecimento sobre '
        'as opções terapêuticas e decisão fundamentada, registrada em '
        'prontuário. Assegura o direito à segunda opinião médica. Determina '
        'a continuidade dos cuidados para aliviar o sofrimento, com conforto '
        'físico, psíquico, social e espiritual, inclusive garantindo o '
        'direito à alta hospitalar.',
    arquivo: 'Resolução nº 1.805-06 do Conselho Federal de Medicina.pdf',
    iconAsset: 'ic_resolucoes',
  ),
];

class EmbasamentoJuridicoScreen extends StatefulWidget {
  const EmbasamentoJuridicoScreen({super.key});

  @override
  State<EmbasamentoJuridicoScreen> createState() =>
      _EmbasamentoJuridicoScreenState();
}

class _EmbasamentoJuridicoScreenState extends State<EmbasamentoJuridicoScreen> {
  /// Índice do documento com a descrição aberta (null = todos fechados).
  /// Só um fica aberto por vez: ao tocar em outro, o anterior se fecha.
  int? _aberto;

  void _alternar(int indice) {
    setState(() => _aberto = _aberto == indice ? null : indice);
  }

  void _abrirPdf(_DocumentoJuridico doc) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PdfViewerScreen(
          titulo: doc.titulo,
          nomeArquivo: doc.arquivo,
        ),
      ),
    );
  }

  Widget _cardDocumento(int indice, _DocumentoJuridico doc) {
    final aberto = _aberto == indice;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () => _alternar(indice),
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(minHeight: AppSpacing.cardHomeHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  children: [
                    Container(
                      width: AppSpacing.badgeSize,
                      height: AppSpacing.badgeSize,
                      decoration: const BoxDecoration(
                        color: AppColors.accent3Tint,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: AppIcon(
                          doc.iconAsset,
                          size: AppSpacing.iconSize,
                          color: AppColors.accent3,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        doc.titulo,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Icon(
                      aberto
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: aberto
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.md,
                      0,
                      AppSpacing.md,
                      AppSpacing.md,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(height: 1, color: AppColors.divider),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          doc.descricao,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        FilledButton.icon(
                          onPressed: () => _abrirPdf(doc),
                          icon: const Icon(Icons.picture_as_pdf_outlined),
                          label: const Text('Abrir PDF'),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Embasamento Jurídico')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        children: [
          for (var i = 0; i < _documentos.length; i++)
            _cardDocumento(i, _documentos[i]),
        ],
      ),
    );
  }
}
