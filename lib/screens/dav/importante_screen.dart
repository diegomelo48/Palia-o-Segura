import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/accordion_section.dart';

Widget _lista(List<String> itens) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: itens
        .map((t) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(t, style: const TextStyle(height: 1.4)),
            ))
        .toList(),
  );
}

class ImportanteScreen extends StatelessWidget {
  const ImportanteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pontos Importantes')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          AccordionSection(
            titulo: 'VALORES E CONFORTO',
            conteudo: _lista(const [
              '● Não sentir dor ou sofrimento intenso',
              '● Estar confortável, mesmo que isso reduza o tempo de vida',
              '● Ter meus sintomas bem controlados',
              '● Dormir bem e estar em paz',
              '● Manter minha dignidade até o fim',
            ]),
          ),
          AccordionSection(
            titulo: 'AUTONOMIA E DECISÕES',
            conteudo: _lista(const [
              '● Poder decidir sobre meus tratamentos',
              '● Não prolongar a vida artificialmente',
              '● Aceitar tratamentos apenas se houver chance real de '
                  'melhora',
              '● Não ser submetido(a) a procedimentos invasivos '
                  'desnecessários',
              '● Ter minhas vontades respeitadas pela equipe de saúde',
            ]),
          ),
          AccordionSection(
            titulo: 'RELAÇÕES E FAMÍLIA',
            conteudo: _lista(const [
              '● Ter minha família por perto',
              '● Não ser um peso para minha família',
              '● Ter conflitos familiares resolvidos',
              '● Poder me despedir das pessoas importantes',
              '● Ter alguém de confiança para decidir por mim, se '
                  'necessário',
            ]),
          ),
          AccordionSection(
            titulo: 'ESPIRITUALIDADE E SENTIDO',
            conteudo: _lista(const [
              '● Ter apoio espiritual ou religioso',
              '● Ter alguém para conversar sobre o sentido da vida',
              '● Resolver pendências emocionais ou espirituais',
              '● Receber rituais ou práticas da minha fé',
              '● Estar em paz com minhas crenças',
            ]),
          ),
          AccordionSection(
            titulo: 'LOCAL E TIPO DE CUIDADO',
            conteudo: _lista(const [
              '● Ficar em casa, se possível',
              '● Evitar internações prolongadas',
              '● Receber cuidados paliativos',
              '● Aceitar UTI apenas se houver chance de recuperação '
                  'significativa',
              '● Não ser reanimado(a) em caso de parada cardíaca, se o '
                  'prognóstico for ruim',
            ]),
          ),
          AccordionSection(
            titulo: 'MEDOS E LIMITES',
            conteudo: _lista(const [
              '● Medo de sentir dor',
              '● Medo de perder minha autonomia',
              '● Medo de ficar dependente de aparelhos',
              '● Medo de ficar sozinho(a)',
              '● Medo de prolongar o sofrimento',
            ]),
          ),
        ],
      ),
    );
  }
}
