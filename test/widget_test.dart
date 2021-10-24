import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hack_live_translate/main.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() {
  testWidgets('Sessions option widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: SessionOptionsWidget('id', (a) {}, [], true, (b) {}),
      ),
    ));
    var widget = find.text('Log events: ');
    expect(widget, findsOneWidget);
  });
}
