import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todolistfire/modals/task_data.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  size: 40,
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Todoey',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${context.watch<TaskData>().taskLists.length} Tasks',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
