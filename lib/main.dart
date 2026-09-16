import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const ListlyApp());
}

class ListlyApp extends StatelessWidget {
  const ListlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101816),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5DE0B0),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF101816),
        title: const Text(
          'Listly',
          style: TextStyle(
            color: Color(0xFF5DE0B0),
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_basket_rounded,
              size: 90,
              color: Color(0xFF5DE0B0),
            ),
            const SizedBox(height: 24),
            const Text(
              'Bem-vindo ao Listly!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Suas compras, muito mais organizadas.',
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Em breve: sua lista de compras!'),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Criar minha lista'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5DE0B0),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
