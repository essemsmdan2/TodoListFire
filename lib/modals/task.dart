import 'package:flutter/material.dart';

class Task {
  bool isChecked = false;
  String text;
  Task(this.text);

  void toggleCheck() {
    isChecked = !isChecked;
  }
}
