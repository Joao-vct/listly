import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get usuarioAtual => _auth.currentUser;

  Future<void> entrar({required String email, required String senha}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: senha,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(_mensagemErro(e.code));
    }
  }

  Future<void> cadastrar({required String email, required String senha}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: senha,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(_mensagemErro(e.code));
    }
  }

  Future<void> recuperarSenha(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw Exception(_mensagemErro(e.code));
    }
  }

  Future<void> sair() async {
    await _auth.signOut();
  }

  String _mensagemErro(String codigo) {
    switch (codigo) {
      case 'invalid-email':
        return 'Digite um e-mail válido.';
      case 'invalid-credential':
      case 'user-not-found':
      case 'wrong-password':
        return 'E-mail ou senha incorretos.';
      case 'email-already-in-use':
        return 'Este e-mail já está cadastrado.';
      case 'weak-password':
        return 'A senha deve ter pelo menos 6 caracteres.';
      case 'too-many-requests':
        return 'Muitas tentativas. Aguarde um pouco e tente novamente.';
      case 'network-request-failed':
        return 'Sem conexão com a internet. Tente novamente.';
      default:
        return 'Não foi possível concluir a operação. Tente novamente.';
    }
  }
}
