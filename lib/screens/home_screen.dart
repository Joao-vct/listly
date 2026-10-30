import 'package:flutter/material.dart';

import '../models/lista_compra.dart';
import '../services/auth_service.dart';
import '../services/lista_service.dart';
import 'detalhes_lista_screen.dart';
import 'nova_lista_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();
  final ListaService _listaService = ListaService();

  late final Stream<List<ListaCompra>> _streamListas;

  bool _salvando = false;

  @override
  void initState() {
    super.initState();
    _streamListas = _listaService.listar();
  }

  void _mostrarMensagem(String mensagem, {bool erro = false}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: erro ? Colors.red.shade700 : const Color(0xFF238B68),
      ),
    );
  }

  // CREATE - Cadastrar lista.
  Future<void> _abrirCadastro() async {
    final resultado = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => const NovaListaScreen()),
    );

    if (!mounted || resultado == null) return;

    setState(() => _salvando = true);

    try {
      await _listaService.criar(
        nome: resultado['nome']!,
        descricao: resultado['descricao'] ?? '',
      );

      _mostrarMensagem('Lista cadastrada com sucesso!');
    } catch (e) {
      _mostrarMensagem('Não foi possível cadastrar a lista.', erro: true);
    } finally {
      if (mounted) {
        setState(() => _salvando = false);
      }
    }
  }

  // UPDATE - Editar lista.
  Future<void> _editarLista(ListaCompra lista) async {
    final resultado = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => NovaListaScreen(lista: lista)),
    );

    if (!mounted || resultado == null) return;

    setState(() => _salvando = true);

    try {
      await _listaService.atualizar(
        id: lista.id,
        nome: resultado['nome']!,
        descricao: resultado['descricao'] ?? '',
      );

      _mostrarMensagem('Lista atualizada com sucesso!');
    } catch (e) {
      _mostrarMensagem('Não foi possível atualizar a lista.', erro: true);
    } finally {
      if (mounted) {
        setState(() => _salvando = false);
      }
    }
  }

  // DELETE - Excluir lista.
  Future<void> _excluirLista(ListaCompra lista) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir lista'),
          content: Text(
            'Tem certeza que deseja excluir "${lista.nome}"?\n\n'
            'Essa ação não poderá ser desfeita.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text(
                'Excluir',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );

    if (!mounted || confirmar != true) return;

    setState(() => _salvando = true);

    try {
      await _listaService.excluir(lista.id);

      _mostrarMensagem('Lista excluída com sucesso!');
    } catch (e) {
      _mostrarMensagem('Não foi possível excluir a lista.', erro: true);
    } finally {
      if (mounted) {
        setState(() => _salvando = false);
      }
    }
  }

  // Abre os detalhes da lista.
  void _abrirDetalhes(ListaCompra lista) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesListaScreen(lista: lista),
      ),
    );
  }

  // Encerra a sessão do usuário.
  Future<void> _sair() async {
    try {
      await _authService.sair();
    } catch (e) {
      _mostrarMensagem('Não foi possível sair. Tente novamente.', erro: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas listas'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _salvando ? null : _sair,
            tooltip: 'Sair',
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: Stack(
        children: [
          StreamBuilder<List<ListaCompra>>(
            stream: _streamListas,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'Não foi possível carregar suas listas.\n'
                      'Verifique sua conexão e tente novamente.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              final listas = snapshot.data ?? [];

              if (listas.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.shopping_basket_outlined,
                          size: 75,
                          color: Color(0xFF5DE0B0),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Nenhuma lista cadastrada',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Crie sua primeira lista de compras!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: _salvando ? null : _abrirCadastro,
                          icon: const Icon(Icons.add),
                          label: const Text('Criar primeira lista'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return ListView.builder(
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
                        lista.descricao.isEmpty
                            ? 'Sem descrição'
                            : lista.descricao,
                      ),

                      // Menu de ações da lista.
                      trailing: PopupMenuButton<String>(
                        tooltip: 'Opções da lista',
                        enabled: !_salvando,
                        onSelected: (opcao) {
                          if (opcao == 'editar') {
                            _editarLista(lista);
                          } else if (opcao == 'excluir') {
                            _excluirLista(lista);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'editar',
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 20),
                                SizedBox(width: 10),
                                Text('Editar'),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'excluir',
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                  color: Colors.redAccent,
                                ),
                                SizedBox(width: 10),
                                Text('Excluir'),
                              ],
                            ),
                          ),
                        ],
                      ),

                      onTap: () => _abrirDetalhes(lista),
                    ),
                  );
                },
              );
            },
          ),

          if (_salvando)
            Container(
              color: Colors.black54,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _salvando ? null : _abrirCadastro,
        backgroundColor: const Color(0xFF5DE0B0),
        foregroundColor: Colors.black,
        icon: const Icon(Icons.add),
        label: const Text('Nova lista'),
      ),
    );
  }
}
