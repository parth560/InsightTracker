import 'package:isar/isar.dart';

part 'emotion_isar.g.dart';

@collection
class EmotionRecord {
  Id? id;
  String emoji;
  DateTime timestamp;

  EmotionRecord(this.emoji, this.timestamp);
}
