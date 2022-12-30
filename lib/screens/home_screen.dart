import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  final TextEditingController _inputText = TextEditingController();
  void _deleteTask(Task task) {
    setState(() {
      tasks.deleteTask(task);
    });
  }

  void _onSave() {
    print(_inputText.text);
    var newTask = Task(title: _inputText.text ??= 'Chưa biết', done: false);
    setState(() {
      tasks.addTask(newTask);
    });
    _inputText.clear();
  }

  void _onCancel() {
    setState(() {
      Navigator.of(context).pop();
    });
    _inputText.clear();
  }

  void updateTask() {
    void onRename(String a, bool b) {
      var newTask = Task(title: a, done: b);
      var oldTask = tasks.findTask(a);

      setState(() {
        tasks.addTask(newTask);
        tasks.deleteTask(oldTask);
        Navigator.of(context).pop();
      });
      _inputText.clear();
    }

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
                            _inputText.text = value;
                            print(value);
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Rename the task",
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () => onRename(
                                    _inputText.text ??= "Chưa có nghĩ ra",
                                    false,
                                  ),
                              child: const Text("Rename")),
                          ElevatedButton(
                              onPressed: () => _onCancel(),
                              child: const Text("Cancel"))
                        ],
                      )
                    ],
                  )));
          ;
        });
  }

  void _createNewTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog(_inputText,  _onSave, _onCancel);
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
        onPressed: _createNewTask,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) =>
            MyCard(tasks.listTask[i], _deleteTask, updateTask),
        itemCount: tasks.listTask.length,
      ),
    );
  }
}
