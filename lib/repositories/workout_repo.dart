// workout_repo.dart

import 'package:isar/isar.dart';
import 'package:tracker_app2/collections/workout_isar.dart';

class WorkoutRepository {
  final IsarCollection<WorkoutRecord> _workouts;

  WorkoutRepository(this._workouts);

  // Get all workout records from Isar database
  Future<List<WorkoutRecord>> getWorkouts() async {
    return await _workouts.where().findAll();
  }

  // Add a new workout record to the Isar database
  Future<void> addWorkout(WorkoutRecord workout) async {
    await _workouts.isar.writeTxn(() async {
      await _workouts.put(workout);
    });
  }

  // Delete a workout record from the Isar database by id
  Future<void> deleteWorkout(Id id) async {
    await _workouts.isar.writeTxn(() async {
      await _workouts.where().filter().idEqualTo(id).deleteAll();
    });
  }
}
