import 'package:flutter/material.dart';
import 'package:flutter_flash_card/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should found 1 card with word and add button in the Home screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('何'), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets(
      'should show bottom sheet that can add a word and auto close after word added',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(BottomSheet), findsOneWidget);
    expect(find.text('Add words here'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'pop');
    await tester.tap(find.text('OK'));

    await tester.pumpAndSettle();
    expect(find.byType(BottomSheet), findsNothing);
  });
}
