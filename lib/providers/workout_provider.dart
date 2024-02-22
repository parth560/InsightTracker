import 'package:flutter/foundation.dart';
import 'package:tracker_app2/collections/workout_isar.dart';
import 'package:tracker_app2/repositories/workout_repo.dart';

class WorkoutProvider extends ChangeNotifier {
  final WorkoutRepository _repository;
  List<WorkoutRecord> _workoutRecords = [];

  WorkoutProvider(this._repository) {
    loadWorkouts();
  }

  List<WorkoutRecord> get workoutRecords => _workoutRecords;

  Future<void> loadWorkouts() async {
    _workoutRecords = await _repository.getWorkouts();
    notifyListeners();
  }

  Future<void> addWorkoutRecord(String exercise, int quantity) async {
    final workoutRecord = WorkoutRecord(exercise, quantity, DateTime.now());
    await _repository.addWorkout(workoutRecord);
    _workoutRecords.add(workoutRecord);
    notifyListeners();
  }

  Future<void> deleteWorkoutRecord(WorkoutRecord record) async {
    await _repository.deleteWorkout(record.id!);
    _workoutRecords.remove(record);
    notifyListeners();
  }
}
