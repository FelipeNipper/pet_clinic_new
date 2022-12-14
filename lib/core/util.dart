import 'package:flutter/material.dart';

class CustomThemes {}

class CustomColors {
  static const Color Yellow = Color.fromRGBO(250, 213, 0, 1);
  static const Color Purple = Color.fromRGBO(101, 110, 212, 1);

  static const Color BoxShadow = Color.fromRGBO(0, 0, 0, 0.06);
}

class Util {
  static String getPhoto(String type) {
    if (type == 'cat') {
      return 'Bella.png';
    } else if (type == 'dog') {
      return 'Simba.png';
    }
    return 'no-pet.png';
  }
}
