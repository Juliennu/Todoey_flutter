import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
    required this.addTaskCallback,
  });

  final Function(Task) addTaskCallback;

  @override
  Widget build(BuildContext context) {
    Task? newTask;

    // keyboard をスクロール範囲に入れる
    return SingleChildScrollView(
      child: Container(
        // keyboard の上に要素を表示するようにする(MediaQuery)
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 24,
                  ),
                ),
                TextField(
                  autofocus: true,
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 4,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    newTask = Task(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    addTaskCallback(newTask ?? Task('title'));
                    // print(newTask!.title);
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
