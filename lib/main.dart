import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:expense_tracker/theme/color_schemes.g.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: MaterialTheme.lightScheme()),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: MaterialTheme.darkScheme()),
      home: Expenses(),
    ),
  );
}
