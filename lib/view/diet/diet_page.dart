import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/diet_provider.dart';
import 'diet_form.dart';
import 'diet_history.dart';

class DietPage extends StatelessWidget {
  final bool isEnglish;

  const DietPage({Key? key, required this.isEnglish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DietForm(isEnglish: isEnglish),
          Expanded(
            child: FutureBuilder(
              future:
                  Provider.of<DietProvider>(context, listen: false).loadDiets(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return DietHistory(isEnglish: isEnglish);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
