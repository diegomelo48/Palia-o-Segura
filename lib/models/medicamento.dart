/// Equivalente ao Medicamento.java — dose equivalente em morfina (mg),
/// usada na calculadora de rotação de opioides.
class Medicamento {
  final String nome;
  final double? doseOralEquivalente;
  final double? doseVenosaEquivalente;

  const Medicamento(this.nome, this.doseOralEquivalente, this.doseVenosaEquivalente);

  bool get temViaOral => doseOralEquivalente != null;
  bool get temViaVenosa => doseVenosaEquivalente != null;

  @override
  String toString() => nome;
}

/// Mesma tabela de equivalência usada em ControleDorActivity.carregarMedicamentos().
const List<Medicamento> medicamentosOpioides = [
  Medicamento('Codeína', 200.0, 100.0),
  Medicamento('Tramadol', 120.0, 100.0),
  Medicamento('Petidina', 300.0, 100.0),
  Medicamento('Morfina', 30.0, 10.0),
  Medicamento('Hidrocodona', 30.0, null),
  Medicamento('Oxicodona', 20.0, 10.0),
  Medicamento('Oximorfona', 10.0, 1.0),
  Medicamento('Hidromorfona', 7.5, 1.5),
  Medicamento('Metadona', 3.0, 1.0),
  Medicamento('Buprenorfina', 0.4, 0.3),
  Medicamento('Fentanil', null, 0.1),
];
