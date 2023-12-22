import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;

  ToDoList({
    super.key,
    required this.taskName,
    required this.taskDone,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: taskDone,
              onChanged: onChanged,
              activeColor: Colors.indigo,
            ),
            Text(
              taskName,
              style: TextStyle(
                  decoration: taskDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            IconButton(
                onPressed: () => onDelete!(context),
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
