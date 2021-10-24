
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hack_live_translate/main.dart';

void main() {
  testWidgets('InitSpeechWidget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: InitSpeechWidget(true, () async {}),
    ));
    var widget = find.text('Initialize');
    expect(widget, findsOneWidget);
  });
}
