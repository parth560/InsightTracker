import 'package:flutter/material.dart';
import 'package:tracker_app2/localization/locale1.dart';
import 'package:tracker_app2/view/diet/diet_page.dart';
import 'package:tracker_app2/widget/bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DietWidget extends StatefulWidget {
  const DietWidget({Key? key}) : super(key: key);

  @override
  _DietWidgetState createState() => _DietWidgetState();
}

class _DietWidgetState extends State<DietWidget> {
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
          _isEnglish ? Locale1Data.EN['title'] : Locale1Data.ES['title'],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _toggleLanguage();
            },
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
      body: DietPage(isEnglish: _isEnglish),
    );
  }
}
