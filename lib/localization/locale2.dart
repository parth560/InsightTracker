import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", Locale2Data.EN),
  MapLocale("de", Locale2Data.ES),
];

mixin Locale2Data {
  static const String title = 'title';
  static const String selectExercise = 'Select Exercise';
  static const String enterCalories = 'Enter Calories';
  static const String recordworkout = 'Record Workout';
  static const String quantity = 'Quantity';

  static const Map<String, dynamic> EN = {
    title: 'Workout Recorder',
    selectExercise: 'Select Exercise',
    enterCalories: 'Enter Calories',
    recordworkout: 'Record Workout',
    quantity: 'Quantity'
  };

  static const Map<String, dynamic> ES = {
    title: 'Grabador de entrenamiento',
    selectExercise: 'Seleccionar alimento',
    enterCalories: 'Ingrese calorias',
    recordworkout: 'grabar entrenamiento',
    quantity: 'Cantidad'
  };
}
