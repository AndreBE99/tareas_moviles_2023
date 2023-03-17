import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  var costController = TextEditingController();
  bool switchUp = false;
  int? _selectedRadio = null;
  int? get getSelectedRadio => _selectedRadio;
  var radioGroupValues = {
    20: "Amazing 20%",
    18: "Good 18%",
    15: "Ok 15%",
  };
  var total;

  void tipcalculation() {
    try {
      if (_selectedRadio != null) {
        total = double.parse(costController.text) +
            (double.parse(costController.text) * (_selectedRadio! / 100));
        if (switchUp) {
          total = total.ceil();
        }
      } else {
        total = costController.text;
      }
    } catch (e) {
      print("Error: ${e}");
      total = "Error";
    }
    notifyListeners();
  }

  void setIsSelected(bool switchValue) {
    switchUp = switchValue;
    notifyListeners();
  }

  void setSelectedRadio(int? radioValue) {
    _selectedRadio = radioValue;
    notifyListeners();
  }
}
