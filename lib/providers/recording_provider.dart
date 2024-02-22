import 'package:flutter/material.dart';
import 'package:tracker_app2/collections/recording_isar.dart';
import 'package:tracker_app2/repositories/recording_repo.dart';

class RecordingProvider extends ChangeNotifier {
  final RecordingRepository _repository;

  List<RecordingRecord> _recordings = [];
  List<RecordingRecord> get recordings => _recordings;

  DateTime _lastRecordTime = DateTime.now();
  String _lastRecordType = '';
  int _recordingPoints = 0;

  DateTime get lastRecordTime => _lastRecordTime;
  String get lastRecordType => _lastRecordType;
  int get recordingPoints => _recordingPoints;

  RecordingProvider(this._repository) {
    _initializeRecordings();
  }

  Future<void> _initializeRecordings() async {
    await getRecordings();
  }

  Future<void> getRecordings() async {
    _recordings = await _repository.getRecordings();
    notifyListeners();
  }

  void recordEvent(String recordType) async {
    DateTime now = DateTime.now();
    int pointsToAdd = 0;

    if (recordType == 'emotion') {
      pointsToAdd = 2;
    } else if (recordType == 'workout') {
      pointsToAdd = 2;
    } else if (recordType == 'diet') {
      pointsToAdd = 4;
    }

    _recordingPoints += pointsToAdd;
    _lastRecordTime = now;
    _lastRecordType = recordType;

    // Update the database here
    await _repository.addRecording(RecordingRecord(
      lastRecorded: now.toString(),
      lastRecordingType: recordType,
      recordingPoints: _recordingPoints,
      dedicationLevel: calculateDedicationLevel(),
      rpNeededForNextLevel: calculateRPForNextLevel(),
      rpForRecordingNow: calculateRPForRecordingNow(),
    ));

    notifyListeners();
  }

  int calculateDedicationLevel() {
    if (_recordingPoints < 5) {
      return 1;
    } else if (_recordingPoints < 10) {
      return 2;
    } else {
      return 3;
    }
  }

  int calculateRPForNextLevel() {
    return (calculateDedicationLevel() + 1) * 10;
  }

  int calculateRPForRecordingNow() {
    return (_recordingPoints + 10);
  }
}
