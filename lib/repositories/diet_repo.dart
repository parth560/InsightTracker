// diet_repo.dart

import 'package:isar/isar.dart';
import 'package:tracker_app2/collections/diet_isar.dart';

class DietRepository {
  final IsarCollection<DietRecord> _diets;

  DietRepository(this._diets);

  // Get all diet records from Isar database
  Future<List<DietRecord>> getDiets() async {
    return await _diets.where().findAll();
  }

  // Add a new diet record to the Isar database
  Future<void> addDiet(DietRecord diet) async {
    await _diets.isar.writeTxn(() async {
      await _diets.put(diet);
    });
  }

  // Delete a diet record from the Isar database by id
  Future<void> deleteDiet(Id id) async {
    await _diets.isar.writeTxn(() async {
      await _diets.where().filter().idEqualTo(id).deleteAll();
    });
  }

  // Update a diet record in the Isar database
  Future<void> updateDiet(DietRecord diet) async {
    await _diets.isar.writeTxn(() async {
      await _diets.put(diet);
    });
  }
}
