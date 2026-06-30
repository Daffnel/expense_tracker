import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:expense_tracker/theme/color_schemes.g.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        //* Text themes
        textTheme: TextTheme().copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: kColorScheme.onSecondaryContainer,
          ),
        ),

        //* Elevated Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: kColorScheme.primaryContainer),
        ),

        //* Card Theme
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),

        useMaterial3: true,
        colorScheme: MaterialTheme.lightScheme(),
      ),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: MaterialTheme.darkScheme()),
      home: Expenses(),
    ),
  );
}
