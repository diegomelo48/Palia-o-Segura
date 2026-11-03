# Security Palli — Flutter

Migração do app Android nativo (Java/XML, pacote `devdiego.gustavo.paliacaosegura`)
para Flutter.

## Ícones — ação necessária

Todos os `Image.asset` do projeto usam o MESMO nome dos drawables originais,
sem extensão fixa no código Dart além de `.png` (ver `lib/widgets/app_icon.dart`).
Para rodar perfeitamente:

1. Crie a pasta `assets/icons/` na raiz do projeto Flutter.
2. Copie os arquivos de ícone do projeto nativo (`res/drawable/`) para lá,
   com o MESMO nome, convertidos para `.png` se ainda forem vetor XML
   (ex: `ic_ecog.xml` → exporte/renderize como `ic_ecog.png`).
3. Nomes exatos esperados em `assets/icons/`:
   `icone.png`, `ic_cad1.png` a `ic_cad5.png`, `ic_controle1.png` a
   `ic_controle5.png`, `ic_ecog.png`, `ic_pps.png`, `ic_kps.png`,
   `ic_ppi.png`, `ic_spict.png`, `ic_necpal.png`, `ic_protocolos.png`,
   `ic_diretivas.png`, `ic_resolucoes.png`, `ic_lei.png`.
4. Os PDFs do Embasamento Jurídico vão em `assets/pdfs/`, com os nomes
   exatos já referenciados em `embasamento_juridico_screen.dart`.
5. A pasta `assets/icons/` e `assets/pdfs/` já estão registradas no
   `pubspec.yaml` — não precisa mexer lá, só colar os arquivos.

Se algum ícone ainda não estiver na pasta, a tela mostra um ícone cinza de
"imagem não encontrada" no lugar, em vez de quebrar — então dá pra rodar o
app e ir completando aos poucos.

## Status — todo o conteúdo migrado

Todas as telas agora têm o texto clínico real (portado dos XMLs originais),
não mais placeholders: Controle da Dor (com calculadora de opioides),
Dispneia, Fadiga, Náuseas, DAV (fluxograma completo + 8 seções), Importante
(6 categorias), SPIKES (6 passos completos), VALUE, GUIDE, REMEMBER,
Pontos-chave, Embasamento Jurídico (5 documentos) e Sobre.

## Como rodar

1. `flutter pub get`
2. Coloque os ícones em `assets/icons/` (ver acima)
3. `flutterfire configure` (se ainda não tiver `firebase_options.dart`)
4. `flutter run`
