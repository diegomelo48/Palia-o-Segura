import 'package:flutter/material.dart';

import '../../models/medicamento.dart';
import '../../theme/app_theme.dart';
import '../../widgets/accordion_section.dart';
import '../../widgets/selectable_scale_item.dart';

class ControleDorScreen extends StatefulWidget {
  const ControleDorScreen({super.key});

  @override
  State<ControleDorScreen> createState() => _ControleDorScreenState();
}

class _ControleDorScreenState extends State<ControleDorScreen> {
  Medicamento _origem = medicamentosOpioides.first;
  Medicamento _destino = medicamentosOpioides.first;
  String _viaOrigem = 'Oral';
  String _viaDestino = 'Oral';
  final _doseController = TextEditingController();
  String _resultado = '';

  @override
  void dispose() {
    _doseController.dispose();
    super.dispose();
  }

  /// Mesma lógica de ControleDorActivity.calcular().
  void _calcular() {
    if (_doseController.text.isEmpty) {
      setState(() => _resultado = 'Informe a dose');
      return;
    }

    final doseInformada = double.tryParse(
        _doseController.text.replaceAll(',', '.'));
    if (doseInformada == null) {
      setState(() => _resultado = 'Dose inválida');
      return;
    }

    final viaOrigemOral = _viaOrigem == 'Oral';
    final viaDestinoOral = _viaDestino == 'Oral';

    final refOrigem = viaOrigemOral
        ? _origem.doseOralEquivalente
        : _origem.doseVenosaEquivalente;
    final refDestino = viaDestinoOral
        ? _destino.doseOralEquivalente
        : _destino.doseVenosaEquivalente;

    if (refOrigem == null || refDestino == null) {
      setState(() =>
          _resultado = 'Via não disponível para o medicamento selecionado');
      return;
    }

    final morfinaEv = (doseInformada / refOrigem) * 10;
    final doseFinal = (morfinaEv / 10) * refDestino;

    setState(() {
      _resultado = 'Dose equivalente: ${doseFinal.toStringAsFixed(2)} mg de '
          '${_destino.nome} (${viaDestinoOral ? 'VO' : 'EV'})';
    });
  }

  Widget _dropdownMedicamento(
    Medicamento valor,
    ValueChanged<Medicamento?> onChanged,
  ) {
    return DropdownButtonFormField<Medicamento>(
      initialValue: valor,
      isExpanded: true,
      items: medicamentosOpioides
          .map((m) => DropdownMenuItem(value: m, child: Text(m.nome)))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _dropdownVia(String valor, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      initialValue: valor,
      items: const [
        DropdownMenuItem(value: 'Oral', child: Text('Oral')),
        DropdownMenuItem(value: 'Venosa', child: Text('Venosa')),
      ],
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controle da Dor')),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'Objetivo: Tratamento impecável da dor física, valorizando '
            'aspectos emocionais e espirituais.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),

          const AccordionSection(
            titulo: 'Avaliação',
            conteudo: Text(
              '• Anamnese completa (local, irradiação, natureza).\n'
              '• Identificar tipo da dor: visceral, óssea ou neuropática.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Medidas Não Medicamentosas',
            conteudo: Text(
              'Geral:\n'
              '• Exercícios de relaxamento\n'
              '• Fisioterapia\n'
              '• Acupuntura\n'
              '• TENS\n'
              '• Musicoterapia\n'
              '• Suporte psicológico\n\n'
              'Local:\n'
              '• Colchões de fluxo de ar\n'
              '• Reposicionamento regular do paciente',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Manejo Farmacológico',
            conteudo: Text(
              'Escada Analgésica da OMS:\n'
              '• Dor fraca: Dipirona ou Paracetamol\n'
              '• Dor moderada: Codeína ou Tramadol\n'
              '• Dor forte: Morfina, Oxicodona ou Fentanil\n\n'
              'Preferir via oral sempre que possível.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Resgate e Titulação',
            conteudo: Text(
              '• Dose de resgate: 1/6 da dose total de 24h.\n'
              '• Se > 4 resgates/dia, aumentar dose basal em 30–50%.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Dor Neuropática',
            conteudo: Text(
              '• Amitriptilina (cautela em idosos)\n'
              '• Gabapentina ou Pregabalina\n'
              '• Considerar emplastro de Lidocaína para dores localizadas.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const AccordionSection(
            titulo: 'Diferenciais e Novas Abordagens',
            conteudo: Text(
              '• Cannabis medicinal: pode ser considerada para conforto e '
              'bem-estar global.\n'
              '• Adjuvantes: Gabapentina ou Pregabalina para dor neuropática.',
              style: TextStyle(height: 1.5),
            ),
          ),

          const SizedBox(height: AppSpacing.lg),
          Text(
            'Conversão de Opioides',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text('Medicamento atual'),
                            _dropdownMedicamento(
                                _origem, (m) => setState(() => _origem = m!)),
                            const SizedBox(height: AppSpacing.sm),
                            _dropdownVia(_viaOrigem,
                                (v) => setState(() => _viaOrigem = v!)),
                            const SizedBox(height: AppSpacing.sm),
                            TextField(
                              controller: _doseController,
                              keyboardType: const TextInputType
                                  .numberWithOptions(decimal: true),
                              decoration: const InputDecoration(
                                  hintText: 'Dose (mg)'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text('Medicamento destino'),
                            _dropdownMedicamento(_destino,
                                (m) => setState(() => _destino = m!)),
                            const SizedBox(height: AppSpacing.sm),
                            _dropdownVia(_viaDestino,
                                (v) => setState(() => _viaDestino = v!)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  FilledButton(
                    onPressed: _calcular,
                    child: const Text('Calcular dose equivalente'),
                  ),
                  ScaleResultCard(texto: _resultado),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
