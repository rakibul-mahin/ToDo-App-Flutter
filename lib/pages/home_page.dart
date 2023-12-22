import 'package:flutter/material.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void onAdd() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    onCancel();
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void onDelete(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onAdd: onAdd,
            onCancel: onCancel,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: const Center(child: Text("ToDo App")),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createTask, child: const Icon(Icons.add)),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: toDoList[index][0],
            taskDone: toDoList[index][1],
            onChanged: (value) => checkBoxChange(value, index),
            onDelete: (context) => onDelete(index),
          );
        },
      ),
    );
  }
}
