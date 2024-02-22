import 'package:flutter/foundation.dart';
import 'package:tracker_app2/collections/diet_isar.dart';
import 'package:tracker_app2/repositories/diet_repo.dart';

class DietProvider extends ChangeNotifier {
  final DietRepository _repository;
  List<DietRecord> _dietRecords = [];

  DietProvider(this._repository) {
    loadDiets();
  }

  List<DietRecord> get dietRecords => _dietRecords;

  Future<void> loadDiets() async {
    _dietRecords = await _repository.getDiets();
    notifyListeners();
  }

  Future<void> addDietRecord(String food, int quantity) async {
    final dietRecord = DietRecord(food, quantity, DateTime.now());
    await _repository.addDiet(dietRecord);
    _dietRecords.add(dietRecord);
    notifyListeners();
  }

  Future<void> deleteDietRecord(DietRecord record) async {
    await _repository.deleteDiet(record.id!);
    _dietRecords.remove(record);
    notifyListeners();
  }

  Future<void> updateDietRecord(DietRecord record) async {
    await _repository.updateDiet(record);
    notifyListeners();
  }
}
