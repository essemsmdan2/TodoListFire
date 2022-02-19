import 'dart:math';

import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  List<ListTile> taskLists = [];
  void remove(index) {}
  void updateMyItems(oldIndex, newIndex) {
    final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final task = taskLists.removeAt(oldIndex);
    taskLists.insert(index, task);
    notifyListeners();
  }

  void increment(String text) {
    taskLists.add(
      ListTile(
        title: Text(text),
        key: ValueKey(Random().nextInt(1000)),
      ),
    );
    notifyListeners();
  }
}
