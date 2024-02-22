import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/emotion_provider.dart';
import 'package:tracker_app2/view/emotion/emotion_card.dart';

class EmotionHistory extends StatelessWidget {
  final bool isEnglish;

  const EmotionHistory(
      {Key? key, required bool isMaterial, required this.isEnglish})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emotionProvider = Provider.of<EmotionProvider>(context);
    return ListView.builder(
      itemCount: emotionProvider.emotions.length,
      itemBuilder: (context, index) {
        final emotion = emotionProvider.emotions[index];
        return EmotionCard(
          emoji: emotion.emoji,
          datetime: emotion.timestamp,
          onDelete: () async {
            emotionProvider.deleteEmotion(emotion);
          },
          isEnglish: isEnglish,
        );
      },
    );
  }
}
