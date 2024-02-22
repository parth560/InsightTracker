import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tracker_app2/collections/diet_isar.dart';
import 'package:tracker_app2/collections/emotion_isar.dart';
import 'package:tracker_app2/collections/recording_isar.dart';
import 'package:tracker_app2/collections/workout_isar.dart';

class Database {
  static late Isar _isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        EmotionRecordSchema,
        DietRecordSchema,
        WorkoutRecordSchema,
        RecordingRecordSchema
      ],
      directory: dir.path,
    );
  }

  static Isar get isar {
    return _isar;
  }
}
