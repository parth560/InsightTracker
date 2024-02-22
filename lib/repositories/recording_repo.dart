import 'package:isar/isar.dart';
import 'package:tracker_app2/collections/recording_isar.dart';

class RecordingRepository {
  final IsarCollection<RecordingRecord> _recordings;

  RecordingRepository(this._recordings);

  Future<List<RecordingRecord>> getRecordings() async {
    return await _recordings.where().findAll();
  }

  Future<void> addRecording(RecordingRecord recording) async {
    await _recordings.isar.writeTxn(() async {
      await _recordings.put(recording);
    });
  }

  Future<void> updateRecording(RecordingRecord recording) async {
    await _recordings.isar.writeTxn(() async {
      await _recordings.put(recording);
    });
  }
}
