import 'package:flutter/material.dart';

class TaskBuilder extends StatefulWidget {
  String text;

  TaskBuilder({Key? key, required this.text}) : super(key: key);

  @override
  State<TaskBuilder> createState() => _TaskBuilderState();
}

class _TaskBuilderState extends State<TaskBuilder> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: widget.key,
      title: Text(widget.text),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = !isChecked;
          });
          print(isChecked);
        },
      ),
    );
  }
}
