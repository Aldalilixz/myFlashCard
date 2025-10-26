import 'package:flutter/material.dart';
import 'package:flutter_flash_card/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should found 1 card in the Home screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('何'), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
  });
}