import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/workout_provider.dart';
import 'package:tracker_app2/view/workout/workout_card.dart';

class WorkoutHistory extends StatelessWidget {
  final bool isEnglish;

  const WorkoutHistory({Key? key, required this.isEnglish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, workoutProvider, child) {
        return Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: workoutProvider.workoutRecords.length,
                itemBuilder: (context, index) {
                  final record = workoutProvider.workoutRecords[index];
                  return WorkoutCard(record: record, isEnglish: isEnglish);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
