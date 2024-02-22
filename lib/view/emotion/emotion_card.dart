import 'package:flutter/material.dart';
import 'package:tracker_app2/localization/locale.dart';

class EmotionCard extends StatelessWidget {
  final String emoji;
  final DateTime datetime;
  final VoidCallback onDelete;
  final bool isEnglish;

  const EmotionCard({
    Key? key,
    required this.emoji,
    required this.datetime,
    required this.onDelete,
    required this.isEnglish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeData = isEnglish ? LocaleData.EN : LocaleData.ES;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${localeData['User is Feeling']}: $emoji',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '${localeData['Date and Time']}: ${datetime.toString()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
