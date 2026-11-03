/// Equivalente ao Usuario.java — representa o usuário cadastrado
/// no Firebase Realtime Database (nó "Usuarios").
class Usuario {
  final String uid;
  final String nome;
  final String email;
  final String crm;
  final String estado;
  final String? fotoUrl;

  const Usuario({
    required this.uid,
    required this.nome,
    required this.email,
    required this.crm,
    required this.estado,
    this.fotoUrl,
  });

  factory Usuario.fromMap(String uid, Map<dynamic, dynamic> map) {
    return Usuario(
      uid: uid,
      nome: map['nome'] as String? ?? '',
      email: map['email'] as String? ?? '',
      crm: map['crm'] as String? ?? '',
      estado: map['estado'] as String? ?? '',
      fotoUrl: map['fotoUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nome': nome,
      'email': email,
      'crm': crm,
      'estado': estado,
      'fotoUrl': fotoUrl,
    };
  }

  /// Preserva uid/estado ao editar só nome, email, crm ou foto —
  /// o mesmo cuidado que corrigimos no PerfilFragment nativo, aqui
  /// já é garantido pelo tipo: não existe um "outro" Usuario para
  /// confundir e sobrescrever o registro inteiro.
  Usuario copyWith({
    String? nome,
    String? email,
    String? crm,
    String? estado,
    String? fotoUrl,
  }) {
    return Usuario(
      uid: uid,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      crm: crm ?? this.crm,
      estado: estado ?? this.estado,
      fotoUrl: fotoUrl ?? this.fotoUrl,
    );
  }
}
