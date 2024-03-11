import 'package:flutter/material.dart';

class ConstsApp {
  static Color? getColorType({
    required bool isAvailable,
  }) {
    switch (isAvailable) {
      case false:
        return Colors.red;

      case true:
        return Colors.green;

      default:
        return Colors.grey;
    }
  }
}
