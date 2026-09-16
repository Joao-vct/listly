import 'package:flutter/material.dart';

class NovaListaScreen extends StatefulWidget {
  const NovaListaScreen({super.key});

  @override
  State<NovaListaScreen> createState() => _NovaListaScreenState();
}

class _NovaListaScreenState extends State<NovaListaScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();

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
      appBar: AppBar(title: const Text('Nova lista'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.playlist_add,
                size: 70,
                color: Color(0xFF5DE0B0),
              ),
              const SizedBox(height: 20),

              const Text(
                'Crie sua lista de compras',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                icon: const Icon(Icons.check),
                label: const Text('Salvar lista'),
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
