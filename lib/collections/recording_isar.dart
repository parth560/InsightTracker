import 'package:isar/isar.dart';

part 'recording_isar.g.dart';

@Collection()
class RecordingRecord {
  Id? id;
  String lastRecorded;
  String lastRecordingType;
  int recordingPoints;
  int dedicationLevel;
  int rpNeededForNextLevel;
  int rpForRecordingNow;

  RecordingRecord({
    required this.lastRecorded,
    required this.lastRecordingType,
    required this.recordingPoints,
    required this.dedicationLevel,
    required this.rpNeededForNextLevel,
    required this.rpForRecordingNow,
  });
}
