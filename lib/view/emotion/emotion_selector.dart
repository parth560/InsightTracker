import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/collections/emotion_isar.dart';
import 'package:tracker_app2/providers/emotion_provider.dart';
import 'package:tracker_app2/providers/recording_provider.dart';

class EmotionSelector extends StatelessWidget {
  const EmotionSelector({Key? key});

  @override
  Widget build(BuildContext context) {
    final emotionProvider = Provider.of<EmotionProvider>(context);
    final recordingProvider = Provider.of<RecordingProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: List.generate(
          24,
          (index) => GestureDetector(
            onTap: () {
              final emoji = String.fromCharCodes([0x1F600 + index]);
              DateTime currentTime = DateTime.now();
              EmotionRecord emotion = EmotionRecord(emoji, currentTime);
              emotionProvider.setEmotion(emotion);

              recordingProvider.recordEvent('emotion');
            },
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                String.fromCharCodes([0x1F600 + index]),
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
