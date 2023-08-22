import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskRow extends StatefulWidget {
  const TaskRow({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskRow> createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.task.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // 取り消し線
            decoration: widget.task.isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 2,
          ),
        ),
        Checkbox(
            value: widget.task.isChecked,
            onChanged: (value) {
              setState(() {
                widget.task.isChecked = !widget.task.isChecked;
              });
            }),
      ],
    );
  }
}
