import 'package:flutter/material.dart';

class TemperatureUnitNotifier extends ChangeNotifier {
  bool _isCelsius = true;

  bool get isCelsius => _isCelsius;

  void toggleTemperatureUnit() {
    _isCelsius = !_isCelsius;
    notifyListeners(); 
  }
}
