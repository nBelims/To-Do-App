import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/models/tasks.dart';

class MyDialog extends StatelessWidget {
  String? inputText;
  MyDialog();

  void onSave() {
    Task createTask(String a, bool b) {
      final newTask = Task(title: a, done: b);
      return newTask;
    }
  }

  void onCancel() {}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
            height: 120,
            child: Column(
              children: [
                TextField(
                    onChanged: (value) {
                      inputText = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add a new task",
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: onSave, child: const Text("Save")),
                    ElevatedButton(
                        onPressed: onCancel, child: const Text("Cancel"))
                  ],
                )
              ],
            )));
  }
}
