import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  get centerProgressBar => Center(child: CircularProgressIndicator());

  get emptyList => Center(child: Text("There is no element in the list"));

  whiteText(String text) => Text(text, style: TextStyle(color: Colors.white));

  popAndPush(String route) {
    Navigator.pop(this);
    Navigator.pushNamedAndRemoveUntil(this, route, (_) => false);
  }
}

extension StringExtension on String {
  String get capitalize => this.length > 0
      ? '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}'
      : '';
}
