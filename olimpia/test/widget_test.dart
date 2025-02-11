import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:olimpia/telas/noticias.dart'; // Importe corretamente a tela NoticiasScreen

void main() {
  testWidgets('Verificar exibição de notícias', (WidgetTester tester) async {
    // Carregar o widget NoticiasScreen dentro de um MaterialApp
    await tester.pumpWidget(MaterialApp(
      home: NoticiasScreen(),
    ));

    // Verificar se o texto da primeira notícia aparece na tela
    expect(find.text('Saiu a classificação da QUIMENINAS, confira o edital no site'), findsOneWidget);

    // Verificar se a imagem da notícia está sendo exibida
    expect(find.byType(Image), findsWidgets); // Verifica se existem imagens na tela
  });
}
