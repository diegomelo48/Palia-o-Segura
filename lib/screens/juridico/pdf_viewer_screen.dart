import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Equivalente à AbrirPDFActivity — recebe o nome do arquivo (mesmo padrão
/// usado no app nativo, com os PDFs como assets) e exibe com zoom/swipe.
///
/// Os PDFs precisam estar em `assets/pdfs/` e registrados no pubspec.yaml,
/// com o mesmo nome de arquivo usado em EmbasamentoJuridicoActivity.java.
class PdfViewerScreen extends StatelessWidget {
  final String titulo;
  final String nomeArquivo;

  const PdfViewerScreen({
    super.key,
    required this.titulo,
    required this.nomeArquivo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: SfPdfViewer.asset(
        'assets/pdfs/$nomeArquivo',
        canShowScrollHead: true,
        canShowScrollStatus: true,
        enableDoubleTapZooming: true,
      ),
    );
  }
}
