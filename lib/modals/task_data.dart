import 'package:todolistfire/modals/task.dart';
import 'package:todolistfire/components/task_builder.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  List<Widget> taskLists = [];
  late String _textFieldValue;

  void increment(String text) {
    taskLists.add(TaskBuilder(
      text: text,
      key: ValueKey(text),
    ));

    notifyListeners();
  }

  void textFieldValue(String value) {
    _textFieldValue = value;
    notifyListeners();
  }

  void updateChecks() {
    taskLists = taskLists;
    notifyListeners();
  }

  //andar com as listas

  void remove(index) {}
  void updateMyItems(oldIndex, newIndex) {
    final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final task = taskLists.removeAt(oldIndex);
    taskLists.insert(index, task);
    notifyListeners();
  }
}
