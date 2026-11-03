import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/usuario.dart';

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _usuariosRef =
      FirebaseDatabase.instance.ref('Usuarios');
  final Reference _fotosRef = FirebaseStorage.instance.ref('FotosPerfil');

  Stream<User?> get authStateChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<UserCredential> login(String email, String senha) {
    return _auth.signInWithEmailAndPassword(email: email, password: senha);
  }

  Future<void> recuperarSenha(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() => _auth.signOut();

  /// Cadastra o usuário no Auth, sobe a foto (se houver) e grava o
  /// registro completo no Realtime Database em uma única chamada —
  /// evitando o problema de sobrescrever campos que não fazem parte
  /// do formulário de edição.
  Future<Usuario> cadastrar({
    required String nome,
    required String email,
    required String crm,
    required String senha,
    required String estado,
    File? foto,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
    final uid = credential.user!.uid;

    String? fotoUrl;
    if (foto != null) {
      final ref = _fotosRef.child('$uid.jpg');
      await ref.putFile(foto);
      fotoUrl = await ref.getDownloadURL();
    }

    final usuario = Usuario(
      uid: uid,
      nome: nome,
      email: email,
      crm: crm,
      estado: estado,
      fotoUrl: fotoUrl,
    );

    await _usuariosRef.child(uid).set(usuario.toMap());
    return usuario;
  }

  Future<Usuario?> buscarUsuarioAtual() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final snapshot = await _usuariosRef.child(uid).get();
    if (!snapshot.exists) return null;

    return Usuario.fromMap(uid, snapshot.value as Map<dynamic, dynamic>);
  }

  /// Atualiza nome/email/crm/foto preservando uid e estado, que não
  /// aparecem no formulário de edição de perfil.
  Future<Usuario> atualizarPerfil({
    required Usuario atual,
    required String nome,
    required String email,
    required String crm,
    String? novaSenha,
    File? novaFoto,
  }) async {
    if (novaSenha != null && novaSenha.isNotEmpty) {
      await _auth.currentUser?.updatePassword(novaSenha);
    }

    String? fotoUrl = atual.fotoUrl;
    if (novaFoto != null) {
      final ref = _fotosRef.child('${atual.uid}.jpg');
      await ref.putFile(novaFoto);
      fotoUrl = await ref.getDownloadURL();
    }

    final atualizado = atual.copyWith(
      nome: nome,
      email: email,
      crm: crm,
      fotoUrl: fotoUrl,
    );

    await _usuariosRef.child(atual.uid).set(atualizado.toMap());
    return atualizado;
  }
}
