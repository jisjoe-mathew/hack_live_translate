import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hack_live_translate/main.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() {
  testWidgets('Speech control widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SpeechControlWidget(true, true, () {}, () {}, () {}),
    ));
    var widget = find.byType(TextButton).last;
    expect(widget, findsOneWidget);
    await tester.tap(widget);
  });
}
