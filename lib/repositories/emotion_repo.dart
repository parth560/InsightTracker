import 'package:isar/isar.dart';
import 'package:tracker_app2/collections/emotion_isar.dart';

class EmotionRepository {
  final IsarCollection<EmotionRecord> _emotions;

  EmotionRepository(this._emotions);

  // Get all emotions from Isar database
  Future<List<EmotionRecord>> getEmotions() async {
    return await _emotions.where().findAll();
  }

  // Add a new emotion record to the Isar database
  Future<void> addEmotion(EmotionRecord emotion) async {
    await _emotions.isar.writeTxn(() async {
      await _emotions.put(emotion);
    });
  }

  // Delete an emotion record from the Isar database by id
  Future<void> deleteEmotion(Id id) async {
    await _emotions.isar.writeTxn(() async {
      await _emotions.where().filter().idEqualTo(id).deleteAll();
    });
  }
}
