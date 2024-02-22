import 'package:flutter/material.dart';
import 'package:tracker_app2/localization/locale2.dart';
import 'package:tracker_app2/view/workout/workout_page.dart';
import 'package:tracker_app2/widget/bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutWidget extends StatefulWidget {
  const WorkoutWidget({Key? key}) : super(key: key);

  @override
  _WorkoutWidgetState createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget> {
  bool _isEnglish = true;

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEnglish ? Locale2Data.EN['title'] : Locale2Data.ES['title'],
        ),
        actions: [
          IconButton(
            onPressed: _toggleLanguage,
            icon: const Icon(FontAwesomeIcons.language),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => BottomSheetWidget(isEnglish: _isEnglish),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: WorkoutPage(isEnglish: _isEnglish),
    );
  }
}
