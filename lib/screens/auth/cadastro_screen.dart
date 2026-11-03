import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/auth_service.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

const _estadosBrasil = [
  'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS',
  'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC',
  'SP', 'SE', 'TO',
];

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _crmController = TextEditingController();
  final _senhaController = TextEditingController();

  String _estado = _estadosBrasil.first;
  File? _foto;
  bool _loading = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _crmController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<void> _selecionarFoto() async {
    final picker = ImagePicker();
    final imagem = await picker.pickImage(source: ImageSource.gallery);
    if (imagem != null) {
      setState(() => _foto = File(imagem.path));
    }
  }

  Future<void> _cadastrar() async {
    final nome = _nomeController.text.trim();
    final email = _emailController.text.trim();
    final crm = _crmController.text.trim();
    final senha = _senhaController.text.trim();

    if (nome.isEmpty || email.isEmpty || crm.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos obrigatórios')),
      );
      return;
    }

    setState(() => _loading = true);
    try {
      await AuthService.instance.cadastrar(
        nome: nome,
        email: email,
        crm: crm,
        senha: senha,
        estado: _estado,
        foto: _foto,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso! Seja bem-vindo!'),
        ),
      );
      Navigator.of(context).pushNamedAndRemoveUntil('/main', (_) => false);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro no cadastro! Tente novamente!')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.primaryLight,
              backgroundImage: _foto != null ? FileImage(_foto!) : null,
              child: _foto == null
                  ? const Icon(Icons.person, size: 56, color: AppColors.primary)
                  : null,
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton(
              onPressed: _selecionarFoto,
              child: const Text('Selecionar foto'),
            ),
            const SizedBox(height: AppSpacing.lg),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  children: [
                    AppTextField(
                      controller: _nomeController,
                      hint: 'Nome de usuário',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    AppTextField(
                      controller: _emailController,
                      hint: 'Email',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AppTextField(
                            controller: _crmController,
                            hint: 'CRM',
                            icon: Icons.badge_outlined,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: _estado,
                            decoration: const InputDecoration(),
                            items: _estadosBrasil
                                .map((uf) => DropdownMenuItem(
                                    value: uf, child: Text(uf)))
                                .toList(),
                            onChanged: (uf) =>
                                setState(() => _estado = uf ?? _estado),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    AppTextField(
                      controller: _senhaController,
                      hint: 'Senha',
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppPrimaryButton(
              label: 'Cadastrar',
              onPressed: _cadastrar,
              loading: _loading,
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
}
