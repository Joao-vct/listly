import 'package:flutter/material.dart';

import '../models/lista_compra.dart';
import 'detalhes_lista_screen.dart';
import 'nova_lista_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ListaCompra> listas = [
    ListaCompra(
      id: '1',
      nome: 'Compras do mês',
      descricao: 'Compras para casa',
      dataCriacao: DateTime.now(),
    ),
    ListaCompra(
      id: '2',
      nome: 'Churrasco',
      descricao: 'Compras para o fim de semana',
      dataCriacao: DateTime.now(),
    ),
  ];

  // Abre o formulário para cadastrar uma nova lista.
  Future<void> _abrirCadastro() async {
    final resultado = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => const NovaListaScreen()),
    );

    if (!mounted || resultado == null) {
      return;
    }

    final novaLista = ListaCompra(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      nome: resultado['nome']!,
      descricao: resultado['descricao'] ?? '',
      dataCriacao: DateTime.now(),
    );

    setState(() {
      listas.add(novaLista);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Lista cadastrada com sucesso!'),
        backgroundColor: Color(0xFF238B68),
      ),
    );
  }

  // Abre os detalhes da lista selecionada.
  void _abrirDetalhes(ListaCompra lista) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesListaScreen(lista: lista),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas listas'), centerTitle: true),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: listas.length,
        itemBuilder: (context, index) {
          final lista = listas[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(
                Icons.shopping_basket,
                color: Color(0xFF5DE0B0),
              ),

              title: Text(lista.nome),

              subtitle: Text(
                lista.descricao.isEmpty ? 'Sem descrição' : lista.descricao,
              ),

              trailing: const Icon(Icons.arrow_forward_ios, size: 16),

              onTap: () {
                _abrirDetalhes(lista);
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirCadastro,
        backgroundColor: const Color(0xFF5DE0B0),
        foregroundColor: Colors.black,
        icon: const Icon(Icons.add),
        label: const Text('Nova lista'),
      ),
    );
  }
}
