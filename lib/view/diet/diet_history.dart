import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/diet_provider.dart';
import 'package:tracker_app2/view/diet/diet_card.dart';

class DietHistory extends StatelessWidget {
  final bool isEnglish;

  const DietHistory({Key? key, required this.isEnglish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DietProvider>(
      builder: (context, dietProvider, child) {
        return Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: dietProvider.dietRecords.length,
                itemBuilder: (context, index) {
                  final record = dietProvider.dietRecords[index];
                  return DietCard(record: record, isEnglish: isEnglish);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
