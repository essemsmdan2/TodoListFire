import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todolistfire/modals/task_data.dart';
import 'package:todolistfire/components/tool_bar.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late String _textFieldValue;

  TextEditingController _controllerTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      color: Color(0xff757575),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'Add Task',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              TextField(
                                controller: _controllerTextField,
                                onChanged: (value) {
                                  _textFieldValue = value;
                                },
                                autofocus: true,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<TaskData>()
                                        .increment(_textFieldValue);
                                    _controllerTextField.clear();
                                  },
                                  child: Text(
                                    'Add',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToolBar(),
            Expanded(
              child: Container(
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
                    for (final task in context.watch<TaskData>().taskLists) task
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
