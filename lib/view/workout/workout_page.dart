import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/workout_provider.dart';
import 'workout_form.dart';
import 'workout_history.dart';

class WorkoutPage extends StatelessWidget {
  final bool isEnglish;
  const WorkoutPage({Key? key, required this.isEnglish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WorkoutForm(isEnglish: isEnglish),
          Expanded(
            child: FutureBuilder(
              future: Provider.of<WorkoutProvider>(context, listen: false)
                  .loadWorkouts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return WorkoutHistory(isEnglish: isEnglish);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
