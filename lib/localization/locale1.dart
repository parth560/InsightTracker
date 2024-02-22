import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", Locale1Data.EN),
  MapLocale("de", Locale1Data.ES),
];

mixin Locale1Data {
  static const String title = 'title';
  static const String enterFoodName = 'Enter Food Name';
  static const String enterFoodQuantity = 'Enter Food Quantity';
  static const String recordDiet = 'Record Diet';
  static const String selectFood = 'Select Food';
  static const String quantity = 'Quantity';

  static const Map<String, dynamic> EN = {
    title: 'Diet Recorder',
    enterFoodName: 'Enter Food Name',
    enterFoodQuantity: 'Enter Food Quantity',
    recordDiet: 'Record Diet',
    selectFood: 'Select Food',
    quantity: 'Quantity'
  };

  static const Map<String, dynamic> ES = {
    title: 'Grabador de dieta',
    enterFoodName: 'Ingrese el nombre del alimento',
    enterFoodQuantity: 'Ingrese la cantidad de alimentos',
    recordDiet: 'Registrar dieta',
    selectFood: 'Selecciona un alimento',
    quantity: 'Cantidad'
  };
}
