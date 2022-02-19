class TaskBuilder {
  late String taskText;
  bool isDone = false;
  TaskBuilder({required this.taskText});

  void toggleIsDone() {
    isDone = !isDone;
  }
}
