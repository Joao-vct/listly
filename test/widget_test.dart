import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:compra_facil/main.dart';

void main() {
  testWidgets('Listly exibe as listas iniciais', (WidgetTester tester) async {
    await tester.pumpWidget(const ListlyApp());

    expect(find.text('Minhas listas'), findsOneWidget);
    expect(find.text('Compras do mês'), findsOneWidget);
    expect(find.text('Churrasco'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_basket), findsNWidgets(2));
  });
}
