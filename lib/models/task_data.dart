import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

// "ChangeNotifier" allows pieces of the data inside this class to notify any listeners which are trying to track the state of the piece of data.
class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task('Buy milk'),
    Task('Buy egg'),
    Task('Buy bread'),
  ];

  List<Task> get tasks => _tasks;

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(newTaskTitle);
    _tasks.add(task);
    // As soon as we update our data, we call "notifyListeners()" so that everybody who's listening to our provider can rebuild thier widget as well because they're notified of that state change.
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
