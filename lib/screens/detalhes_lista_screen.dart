import 'package:flutter/material.dart';

import '../models/lista_compra.dart';

class DetalhesListaScreen extends StatelessWidget {
  final ListaCompra lista;

  const DetalhesListaScreen({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    final data =
        '${lista.dataCriacao.day.toString().padLeft(2, '0')}/'
        '${lista.dataCriacao.month.toString().padLeft(2, '0')}/'
        '${lista.dataCriacao.year}';

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da lista'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.shopping_basket,
              size: 80,
              color: Color(0xFF5DE0B0),
            ),
            const SizedBox(height: 24),

            Text(
              lista.nome,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Descrição',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5DE0B0),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      lista.descricao.isEmpty
                          ? 'Nenhuma descrição informada.'
                          : lista.descricao,
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 12),
                    const Text(
                      'Data de criação',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5DE0B0),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(data),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
