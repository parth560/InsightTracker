import 'package:isar/isar.dart';

part 'workout_isar.g.dart';

@Collection()
class WorkoutRecord {
  Id? id;
  String exercise;
  int quantity;
  DateTime timestamp;

  WorkoutRecord(this.exercise, this.quantity, this.timestamp);
}
