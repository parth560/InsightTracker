import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/user_record_provider.dart';
import 'package:tracker_app2/providers/workout_provider.dart';
import 'package:tracker_app2/view/workout_recorder.dart';

void main() {
  testWidgets('Recorded workout appears in WorkoutLog',
      (WidgetTester tester) async {
    final WorkoutProvider workoutProvider = WorkoutProvider();
    final UserRecordProvider userRecordProvider = UserRecordProvider();
    final WorkoutRecorder workoutRecorder = WorkoutRecorder();

    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => workoutProvider),
            ChangeNotifierProvider(create: (_) => userRecordProvider),
          ],
          child: Scaffold(body: workoutRecorder),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('exerciseDropdown')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Running').last);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '5');
    await tester.tap(find.byType(ElevatedButton));

    // Waiting for the widgets to rebuild
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Exercise: Running 🏃'), findsOneWidget);
    expect(find.text('Quantity: 5'), findsOneWidget);
  });
}
