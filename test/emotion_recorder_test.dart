import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/user_record_provider.dart';
import 'package:tracker_app2/providers/emotion_provider.dart';

void main() {
  testWidgets('should display the selected emoji and time in the list',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserRecordProvider()),
            ChangeNotifierProvider(create: (_) => EmotionProvider()),
          ],
          child: EmotionRecorder(),
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();

    expect(find.text('User is feeling: 😀'), findsOneWidget);
    expect(find.textContaining('Date and Time:'), findsOneWidget);
  });
}

EmotionRecorder() {}
