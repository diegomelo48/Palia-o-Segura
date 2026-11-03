import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/auth/cadastro_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/recuperar_senha_screen.dart';
import 'screens/auth/splash_screen.dart';
import 'screens/comunicacao/comunicacao_mas_noticias_screen.dart';
import 'screens/comunicacao/pontos_chave_screen.dart';
import 'screens/comunicacao/protocolo_guide_screen.dart';
import 'screens/comunicacao/protocolo_remap_screen.dart';
import 'screens/comunicacao/protocolo_spikes_screen.dart';
import 'screens/comunicacao/protocolo_value_screen.dart';
import 'screens/dav/dav_screen.dart';
import 'screens/dav/documentos_antecipatorios_screen.dart';
import 'screens/dav/importante_screen.dart';
import 'screens/escalas/escala_ecog_screen.dart';
import 'screens/escalas/escala_kps_screen.dart';
import 'screens/escalas/escala_necpal_screen.dart';
import 'screens/escalas/escala_ppi_screen.dart';
import 'screens/escalas/escala_pps_screen.dart';
import 'screens/escalas/escala_spict_screen.dart';
import 'screens/escalas/escalas_screen.dart';
import 'screens/juridico/embasamento_juridico_screen.dart';
import 'screens/main/main_screen.dart';
import 'screens/sintomas/controle_dispneia_screen.dart';
import 'screens/sintomas/controle_dor_screen.dart';
import 'screens/sintomas/controle_fadiga_screen.dart';
import 'screens/sintomas/controle_nauseas_screen.dart';
import 'screens/sintomas/controle_sintomas_screen.dart';
import 'screens/sintomas/outros_controles_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Gerado pelo `flutterfire configure` — substitui o google-services.json
  // do projeto Android original.
  await Firebase.initializeApp();

  runApp(const PaliacaoSeguraApp());
}

class PaliacaoSeguraApp extends StatelessWidget {
  const PaliacaoSeguraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Security Palli',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {
        // Autenticação
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        '/cadastro': (_) => const CadastroScreen(),
        '/recuperar-senha': (_) => const RecuperarSenhaScreen(),
        '/main': (_) => const MainScreen(),

        // Escalas
        '/escalas': (_) => const EscalasScreen(),
        '/escalas/ecog': (_) => const EscalaEcogScreen(),
        '/escalas/kps': (_) => const EscalaKpsScreen(),
        '/escalas/pps': (_) => const EscalaPpsScreen(),
        '/escalas/ppi': (_) => const EscalaPpiScreen(),
        '/escalas/spict': (_) => const EscalaSpictScreen(),
        '/escalas/necpal': (_) => const EscalaNecpalScreen(),

        // Controle de sintomas
        '/controle-sintomas': (_) => const ControleSintomasScreen(),
        '/sintomas/dor': (_) => const ControleDorScreen(),
        '/sintomas/dispneia': (_) => const ControleDispneiaScreen(),
        '/sintomas/fadiga': (_) => const ControleFadigaScreen(),
        '/sintomas/nauseas': (_) => const ControleNauseasScreen(),
        '/sintomas/outros': (_) => const OutrosControlesScreen(),

        // Comunicação de más notícias
        '/comunicacao-mas-noticias': (_) =>
            const ComunicacaoMasNoticiasScreen(),
        '/comunicacao/spikes': (_) => const ProtocoloSpikesScreen(),
        '/comunicacao/value': (_) => const ProtocoloValueScreen(),
        '/comunicacao/guide': (_) => const ProtocoloGuideScreen(),
        '/comunicacao/remap': (_) => const ProtocoloRemapScreen(),
        '/comunicacao/pontos-chave': (_) => const PontosChaveScreen(),

        // Embasamento jurídico
        '/embasamento-juridico': (_) => const EmbasamentoJuridicoScreen(),
        // O visualizador de PDF (`PdfViewerScreen`) é aberto via
        // Navigator.push direto (precisa de parâmetros), não por rota nomeada.

        // Documentos antecipatórios / DAV
        '/documentos-antecipatorios': (_) =>
            const DocumentosAntecipatoriosScreen(),
        '/dav/dav': (_) => const DavScreen(),
        '/dav/importante': (_) => const ImportanteScreen(),
      },
    );
  }
}
