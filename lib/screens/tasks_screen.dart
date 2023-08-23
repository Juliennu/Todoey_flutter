import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/task_row.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
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
            // Calls `context.watch` to make it rebuild when [TaskData] changes.
            '${context.watch<TaskData>().taskCount} Tasks',
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
          children: context
              .watch<TaskData>()
              .tasks
              .map((task) => TaskRow(task: task))
              .toList(),
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
              builder: (context) => AddTaskScreen(addTaskCallback: (task) {
                    setState(() {
                      // Calls `context.read` instead of `context.watch` so that it does not rebuild when [TaskData] changes.
                      context.read<TaskData>().addTask(task.title);
                    });
                  }));
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
