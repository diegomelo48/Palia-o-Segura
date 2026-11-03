import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/app_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _loading = false;
  bool _senhaVisivel = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<void> _entrar() async {
    final email = _emailController.text.trim();
    final senha = _senhaController.text.trim();

    if (email.isEmpty) {
      _mostrarErro('Digite o e-mail');
      return;
    }
    if (senha.isEmpty) {
      _mostrarErro('Digite a senha');
      return;
    }

    setState(() => _loading = true);
    try {
      await AuthService.instance.login(email, senha);
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/main');
    } on FirebaseAuthException {
      _mostrarErro('Erro ao fazer login');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xl),
              const AppIcon('icone', size: 72),
              const SizedBox(height: AppSpacing.sm),
              Text('Security Palli',
                  style: Theme.of(context).textTheme.headlineSmall),
              Text(
                'Entre para continuar',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: AppSpacing.lg),
              AppTextField(
                controller: _emailController,
                hint: 'Digite seu email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _senhaController,
                hint: 'Senha',
                icon: Icons.lock_outline,
                obscureText: !_senhaVisivel,
                suffixIcon: IconButton(
                  icon: Icon(
                    _senhaVisivel
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () =>
                      setState(() => _senhaVisivel = !_senhaVisivel),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/recuperar-senha'),
                  child: const Text('Esqueceu a senha?'),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppPrimaryButton(
                label: 'Entrar',
                onPressed: _entrar,
                loading: _loading,
              ),
              const SizedBox(height: AppSpacing.lg),
              Center(
                child: TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/cadastro'),
                  child: const Text('Não tem conta? Cadastre-se'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
