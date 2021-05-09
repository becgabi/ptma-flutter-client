import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  get centerProgressBar => Center(child: CircularProgressIndicator());

  whiteText(String text) => Text(text, style: TextStyle(color: Colors.white));
}

extension StringExtension on String {
  String get capitalize => this.length > 0
      ? '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}'
      : '';
}
