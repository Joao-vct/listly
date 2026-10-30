import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/lista_compra.dart';

class ListaService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Acessa somente as listas do usuário autenticado.
  CollectionReference<Map<String, dynamic>> get _listas {
    final usuario = _auth.currentUser;

    if (usuario == null) {
      throw StateError('Usuário não autenticado.');
    }

    return _firestore.collection('users').doc(usuario.uid).collection('listas');
  }

  // READ: acompanha as listas em tempo real.
  Stream<List<ListaCompra>> listar() {
    return _listas.snapshots().map((snapshot) {
      final listas = snapshot.docs
          .map((documento) => ListaCompra.fromFirestore(documento))
          .toList();

      listas.sort((a, b) => b.dataCriacao.compareTo(a.dataCriacao));

      return listas;
    });
  }

  // CREATE: cadastra uma lista no Firestore.
  Future<void> criar({required String nome, required String descricao}) async {
    final documento = _listas.doc();

    final lista = ListaCompra(
      id: documento.id,
      nome: nome,
      descricao: descricao,
      dataCriacao: DateTime.now(),
    );

    await documento.set(lista.toFirestore());
  }

  // UPDATE: edita uma lista existente.
  Future<void> atualizar({
    required String id,
    required String nome,
    required String descricao,
  }) async {
    await _listas.doc(id).update({'nome': nome, 'descricao': descricao});
  }

  // DELETE: exclui uma lista definitivamente.
  Future<void> excluir(String id) async {
    await _listas.doc(id).delete();
  }
}
