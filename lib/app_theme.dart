import 'package:flutter/material.dart';
import 'package:mobile_banking/data/constants.dart';

class AppTheme {
  static light(BuildContext context) => ThemeData(
      primaryColor: accentColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(primary: accentColor),
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
          foregroundColor: Colors.black,
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0));
}
