import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/diet_provider.dart';
import 'package:tracker_app2/providers/user_record_provider.dart';

void main() {
  testWidgets('Recorded diet appears in DietLog', (WidgetTester tester) async {
    // Arrange
    final DietProvider dietProvider = DietProvider();
    final UserRecordProvider userRecordProvider = UserRecordProvider();
    final DietRecorder dietRecorder = DietRecorder();

    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => dietProvider),
            ChangeNotifierProvider(create: (_) => userRecordProvider),
          ],
          child: Scaffold(body: dietRecorder),
        ),
      ),
    );

    // Act
    await tester.enterText(find.byType(TextField).at(0), 'Apple');
    await tester.enterText(find.byType(TextField).at(1), '3');
    await tester.tap(find.byType(ElevatedButton));

    // Waiting for the widgets to rebuild
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Food: Apple'), findsOneWidget);
    expect(find.text('Quantity: 3'), findsOneWidget);
  });
}

class DietRecorder {}
