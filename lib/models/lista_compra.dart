import 'package:cloud_firestore/cloud_firestore.dart';

class ListaCompra {
  final String id;
  final String nome;
  final String descricao;
  final DateTime dataCriacao;

  ListaCompra({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.dataCriacao,
  });

  // Converte os dados do Firestore para uma ListaCompra.
  factory ListaCompra.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> documento,
  ) {
    final dados = documento.data()!;

    return ListaCompra(
      id: documento.id,
      nome: dados['nome'] as String,
      descricao: dados['descricao'] as String? ?? '',
      dataCriacao: (dados['dataCriacao'] as Timestamp).toDate(),
    );
  }

  // Converte a ListaCompra para dados que o Firestore aceita.
  Map<String, dynamic> toFirestore() {
    return {
      'nome': nome,
      'descricao': descricao,
      'dataCriacao': Timestamp.fromDate(dataCriacao),
    };
  }
}
