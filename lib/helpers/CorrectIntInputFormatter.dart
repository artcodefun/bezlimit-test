
import 'package:flutter/services.dart';

class CorrectIntInputFormatter extends TextInputFormatter{
  CorrectIntInputFormatter({ this.maxValue =100, this.minValue =0});
  final int maxValue;
  final int minValue;
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text == "") {
      return newValue;
    }
    if(int.tryParse(newValue.text)==null) {
      return oldValue;
    }

    int value = int.parse(newValue.text);

    if(newValue.text!="$value") {
      return oldValue;
    }
    if(value < minValue || value > maxValue) {
      return oldValue;
    }

    return newValue;
  }

}