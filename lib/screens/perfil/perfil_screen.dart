import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/usuario.dart';
import '../../services/auth_service.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  Usuario? _usuario;
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    _carregar();
  }

  Future<void> _carregar() async {
    final usuario = await AuthService.instance.buscarUsuarioAtual();
    if (!mounted) return;
    setState(() {
      _usuario = usuario;
      _carregando = false;
    });
  }

  Future<void> _abrirEdicao() async {
    if (_usuario == null) return;
    final atualizado = await showModalBottomSheet<Usuario>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _EditarPerfilSheet(usuario: _usuario!),
    );
    if (atualizado != null) {
      setState(() => _usuario = atualizado);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_carregando) {
      return const Center(child: CircularProgressIndicator());
    }

    final usuario = _usuario;
    if (usuario == null) {
      return const Center(child: Text('Não foi possível carregar o perfil.'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          CircleAvatar(
            radius: 56,
            backgroundColor: AppColors.primaryLight,
            child: ClipOval(
              child: usuario.fotoUrl != null
                  ? CachedNetworkImage(
                      imageUrl: usuario.fotoUrl!,
                      width: 112,
                      height: 112,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.person,
                      size: 56, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(usuario.nome, style: Theme.of(context).textTheme.titleMedium),
          Text(usuario.email, style: Theme.of(context).textTheme.bodySmall),
          Text('CRM: ${usuario.crm}',
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: _abrirEdicao,
            child: const Text('Editar perfil'),
          ),
        ],
      ),
    );
  }
}

/// Formulário de edição — recebe o Usuario completo e devolve o Usuario
/// atualizado, sempre preservando uid e estado, que não são editáveis aqui.
class _EditarPerfilSheet extends StatefulWidget {
  final Usuario usuario;
  const _EditarPerfilSheet({required this.usuario});

  @override
  State<_EditarPerfilSheet> createState() => _EditarPerfilSheetState();
}

class _EditarPerfilSheetState extends State<_EditarPerfilSheet> {
  late final _nomeController = TextEditingController(text: widget.usuario.nome);
  late final _emailController =
      TextEditingController(text: widget.usuario.email);
  late final _crmController = TextEditingController(text: widget.usuario.crm);
  final _senhaController = TextEditingController();

  File? _novaFoto;
  bool _salvando = false;

  Future<void> _selecionarFoto() async {
    final imagem =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagem != null) setState(() => _novaFoto = File(imagem.path));
  }

  Future<void> _salvar() async {
    setState(() => _salvando = true);
    try {
      final atualizado = await AuthService.instance.atualizarPerfil(
        atual: widget.usuario,
        nome: _nomeController.text.trim(),
        email: _emailController.text.trim(),
        crm: _crmController.text.trim(),
        novaSenha: _senhaController.text.trim(),
        novaFoto: _novaFoto,
      );
      if (!mounted) return;
      Navigator.of(context).pop(atualizado);
    } finally {
      if (mounted) setState(() => _salvando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.md,
        right: AppSpacing.md,
        top: AppSpacing.md,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Editar Perfil', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          GestureDetector(
            onTap: _selecionarFoto,
            child: CircleAvatar(
              radius: 44,
              backgroundColor: AppColors.primaryLight,
              backgroundImage: _novaFoto != null ? FileImage(_novaFoto!) : null,
              child: _novaFoto == null
                  ? const Icon(Icons.camera_alt_outlined, color: AppColors.primary)
                  : null,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(controller: _nomeController, hint: 'Nome'),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(controller: _emailController, hint: 'Email'),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(controller: _crmController, hint: 'CRM'),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            controller: _senhaController,
            hint: 'Nova senha (opcional)',
            obscureText: true,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppPrimaryButton(
            label: 'Salvar',
            onPressed: _salvar,
            loading: _salvando,
          ),
        ],
      ),
    );
  }
}
