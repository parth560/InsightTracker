import 'package:flutter/material.dart';
import 'package:tracker_app2/collections/emotion_isar.dart';
import 'package:tracker_app2/repositories/emotion_repo.dart';

class EmotionProvider extends ChangeNotifier {
  final EmotionRepository _repository;

  EmotionProvider(this._repository);

  List<EmotionRecord> _emotions = [];
  List<EmotionRecord> get emotions => _emotions;

  get selectedEmotion => null;

  void setEmotion(EmotionRecord emotion) async {
    await _repository.addEmotion(emotion);
    _emotions = await _repository.getEmotions();
    notifyListeners();
  }

  Future<void> getEmotions() async {
    _emotions = await _repository.getEmotions();
    notifyListeners();
  }

  void deleteEmotion(EmotionRecord emotion) async {
    if (emotion.id != null) {
      await _repository.deleteEmotion(emotion.id!);
      _emotions.removeWhere((element) => element.id == emotion.id);
      notifyListeners();
    } else {
      print('Error: Emotion ID is null');
    }
  }
}
