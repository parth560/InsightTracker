import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", Locale3Data.EN),
  MapLocale("de", Locale3Data.ES),
];

mixin Locale3Data {
  static const String title = 'title';
  static const String lastRecorded = 'lastRecorded';
  static const String lastRecordingType = 'lastRecordingType';
  static const String recordingPoints = 'recordingPoints';
  static const String dedicationLevel = 'dedicationLevel';
  static const String rpNeededForNextLevel = 'rpNeededForNextLevel';
  static const String rpForRecordingNow = 'rpForRecordingNow';
  static const String recordingInformation = 'recordingInformation';
  static const String tapToView = 'tapToView';

  static const List<String> exerciseListEN = [
    'Running',
    'Cycling',
    'Weightlifting',
    'Swimming',
    'Yoga',
    'Jumping Jacks',
    'Squats',
  ];

  static const List<String> exerciseListES = [
    'Correr',
    'Ciclismo',
    'Levantamiento de pesas',
    'Natación',
    'Yoga',
    'Saltos de tijera',
    'Sentadillas',
  ];

  static const Map<String, dynamic> EN = {
    title: 'title',
    lastRecorded: 'Last Recorded',
    lastRecordingType: 'Last Recording Type',
    recordingPoints: 'Recording Points',
    dedicationLevel: 'Dedication Level',
    rpNeededForNextLevel: 'RP Needed for Next Level',
    rpForRecordingNow: 'RP for Recording Now',
    recordingInformation: 'recordingInformation',
    tapToView: 'tapToView'
  };

  static const Map<String, dynamic> ES = {
    lastRecorded: 'Última grabación',
    lastRecordingType: 'Tipo de última grabación',
    recordingPoints: 'Puntos de grabación',
    dedicationLevel: 'Nivel de dedicación',
    rpNeededForNextLevel: 'RP necesarios para el próximo nivel',
    rpForRecordingNow: 'RP para grabar ahora',
    recordingInformation: 'grabaciónInformación',
    tapToView: 'toque para ver'
  };
}
