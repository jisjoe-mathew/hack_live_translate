import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hack_live_translate/main.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() {
  testWidgets('Speech status widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SpeechStatusWidget(
        speech: SpeechToText(),
      ),
    ));
    var widget = find.text('Not listening');
    expect(widget, findsOneWidget);
  });
}
