import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:numbered_rating/numbered_rating.dart';

void main() {
  testWidgets(
      'finds all ratings from minRating to maxRating defaults from 1 to 5',
      (tester) async {
    final form = MaterialApp(
        home: Scaffold(
      body: NumberedRating(),
    ));

    await tester.pumpWidget(form);
    for (var i = 1; i < 6; i++) {
      expect(find.text(i.toString()), findsOneWidget);
    }
    expect(find.text("0"), findsNothing);
    expect(find.text("6"), findsNothing);
  });
  testWidgets('min and maxrating are used', (tester) async {
    final form = MaterialApp(
        home: Scaffold(
      body: NumberedRating(
        minRating: 2,
        maxRating: 4,
      ),
    ));

    await tester.pumpWidget(form);
    for (var i = 2; i < 5; i++) {
      expect(find.text(i.toString()), findsOneWidget);
    }
    expect(find.text("1"), findsNothing);
    expect(find.text("5"), findsNothing);
  });

  testWidgets('tap selects the number', (tester) async {
    var selected = 0;
    final form = MaterialApp(
        home: Scaffold(
      body: NumberedRating(
        selectedColor: Colors.amber,
        onSelectRating: (val) {
          selected = val;
        },
      ),
    ));

    await tester.pumpWidget(form);
    await tester.tap(find.text("1"));
    await tester.pump();

    expect(selected, 1);
  });
}
