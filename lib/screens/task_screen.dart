import 'dart:math';
import 'package:todolistfire/components/task_builder.dart';
import 'package:todolistfire/modals/task.dart';

import 'task_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todolistfire/modals/task_data.dart';
import 'package:todolistfire/components/tool_bar.dart';
import 'package:todolistfire/components/task_builder.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String _textFieldValue = "";
  bool isChecked = false;

  TextEditingController _controllerTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TaskAddScreen(
          controllerTextField: _controllerTextField,
          textFieldValue: _textFieldValue),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToolBar(),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ReorderableListView(
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        context
                            .read<TaskData>()
                            .updateMyItems(oldIndex, newIndex);
                      });
                    },
                    children: [
                      for (final task in context.watch<TaskData>().taskLists)
                        task
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
