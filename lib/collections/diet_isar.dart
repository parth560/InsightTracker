import 'package:isar/isar.dart';

part 'diet_isar.g.dart';

@collection
class DietRecord {
  Id? id;
  String food;
  int quantity;
  DateTime timestamp;

  DietRecord(this.food, this.quantity, this.timestamp);
}
