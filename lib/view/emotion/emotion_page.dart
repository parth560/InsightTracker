import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/emotion_provider.dart';
import 'emotion_selector.dart';
import 'emotion_history.dart';

class EmotionPage extends StatelessWidget {
  final bool isEnglish;

  const EmotionPage({Key? key, required this.isEnglish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const EmotionSelector(),
          Expanded(
            child: FutureBuilder(
                future: Provider.of<EmotionProvider>(context, listen: false)
                    .getEmotions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return EmotionHistory(
                        isMaterial: true, isEnglish: isEnglish);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
