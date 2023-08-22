import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/task_row.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final task1 = Task('Buy milk', false);
    final task2 = Task('Buy egg', false);
    final task3 = Task('Buy bread', true);

    List<Task> tasks = [task1, task2, task3];
    // Task newTask;
    Widget buildBottomSheet(BuildContext context) {
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
                    // fillColor: Colors.lightBlue,
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      final newTask = Task(value, false);
                      tasks.add(newTask);
                      Navigator.pop(context);
                    });
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
                    // tasks.add(newTask);
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

    Widget headerView = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 44,
            child: Icon(
              Icons.list,
              size: 56,
              color: Colors.lightBlue,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'Todoey',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Text(
            '${tasks.length} Tasks',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    Widget listView = Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 44,
            horizontal: 32,
          ),
          children: tasks.map((task) => TaskRow(task: task)).toList(),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ハーフモーダル
          showModalBottomSheet(
            isScrollControlled: true, // full screen
            context: context, // tells navigation stack and theme
            builder: buildBottomSheet,
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 44,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerView,
          listView,
        ],
      ),
    );
  }
}
