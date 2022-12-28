import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/my_card.dart';
import 'package:to_do_list/models/tasks.dart';
import 'package:to_do_list/widgets/dialog.dart';

import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Tasks tasks = Tasks();

  String? _inputText;
  void deleteTask(Task task) {
    setState(() {
      tasks.deleteTask(task);
    });
  }

  void onSave(String a, bool b) {
    var newTask = Task(title: a, done: b);
    setState(() {
      tasks.addTask(newTask);
      Navigator.of(context).pop();
    });
    _inputText = '';
  }

  void onCancel() {
    setState(() {
      Navigator.of(context).pop();
    });
    _inputText = '';
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              content: Container(
                  height: 120,
                  child: Column(
                    children: [
                      TextField(
                          onChanged: (value) {
                            _inputText = value;
                            print(value);
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Add a new task",
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () => onSave(
                                  _inputText ??= "Chưa có nghĩ ra", false),
                              child: const Text("Save")),
                          ElevatedButton(
                              onPressed: () => onCancel(),
                              child: const Text("Cancel"))
                        ],
                      )
                    ],
                  )));
          ;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text('To Do',
                style: TextStyle(color: Colors.black, fontSize: 30)),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.restore, color: Colors.black, size: 30),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const StadiumBorder(
            side: BorderSide(color: Colors.black, width: 1)),
        onPressed: createNewTask,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => MyCard(tasks.listTask[i], deleteTask),
        itemCount: tasks.listTask.length,
      ),
    );
  }
}
