import 'package:flutter/material.dart';
import 'package:tracker_app2/localization/locale.dart';
import 'package:tracker_app2/view/emotion/emotion_page.dart';
import 'package:tracker_app2/widget/bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmotionWidget extends StatefulWidget {
  const EmotionWidget({Key? key}) : super(key: key);

  @override
  _EmotionWidgetState createState() => _EmotionWidgetState();
}

class _EmotionWidgetState extends State<EmotionWidget> {
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
          _isEnglish ? LocaleData.EN['title']! : LocaleData.ES['title']!,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _toggleLanguage();
            },
            icon: Icon(FontAwesomeIcons.language),
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
      body: EmotionPage(isEnglish: _isEnglish),
    );
  }
}
