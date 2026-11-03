import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../perfil/perfil_screen.dart';
import '../privacidade/privacidade_screen.dart';
import '../sobre/sobre_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  static const _titulos = ['Início', 'Sobre', 'Perfil', 'Privacidade'];

  static const _telas = [
    HomeScreen(),
    SobreScreen(),
    PerfilScreen(),
    PrivacidadeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titulos[_index])),
      body: IndexedStack(index: _index, children: _telas),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: 'Sobre'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Perfil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.privacy_tip_outlined), label: 'Privacidade'),
        ],
      ),
    );
  }
}
