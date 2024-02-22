import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocaleData.EN),
  MapLocale("de", LocaleData.ES),
];

mixin LocaleData {
  static const String title = 'title';
  static const String userisfeeling = 'User is Feeling';
  static const String dateandtime = 'Date and Time';

  static const Map<String, dynamic> EN = {
    title: 'Emotion Recorder',
    userisfeeling: 'User is Feeling',
    dateandtime: 'Date and Time'
  };

  static const Map<String, dynamic> ES = {
    title: 'Grabador de emociones',
    userisfeeling: 'El usuario se siente',
    dateandtime: 'fecha y hora'
  };
}
