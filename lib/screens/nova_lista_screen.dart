import 'package:flutter/material.dart';

import '../models/lista_compra.dart';

class NovaListaScreen extends StatefulWidget {
  final ListaCompra? lista;

  const NovaListaScreen({super.key, this.lista});

  @override
  State<NovaListaScreen> createState() => _NovaListaScreenState();
}

class _NovaListaScreenState extends State<NovaListaScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();

  // Verifica se estamos editando uma lista existente.
  bool get _editando => widget.lista != null;

  @override
  void initState() {
    super.initState();

    // Preenche os campos quando a tela é aberta para edição.
    if (_editando) {
      _nomeController.text = widget.lista!.nome;
      _descricaoController.text = widget.lista!.descricao;
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvarLista() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, {
        'nome': _nomeController.text.trim(),
        'descricao': _descricaoController.text.trim(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editando ? 'Editar lista' : 'Nova lista'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                _editando ? Icons.edit_note : Icons.playlist_add,
                size: 70,
                color: const Color(0xFF5DE0B0),
              ),

              const SizedBox(height: 20),

              Text(
                _editando
                    ? 'Edite sua lista de compras'
                    : 'Crie sua lista de compras',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome da lista',
                  hintText: 'Ex.: Compras da semana',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.shopping_basket),
                ),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Digite o nome da lista';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _descricaoController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Descrição (opcional)',
                  hintText: 'Ex.: Produtos para casa',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.notes),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: _salvarLista,
                icon: Icon(_editando ? Icons.save : Icons.check),
                label: Text(_editando ? 'Salvar alterações' : 'Salvar lista'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5DE0B0),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
