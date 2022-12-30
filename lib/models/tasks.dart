import 'package:flutter/material.dart';
import 'task.dart';

class Tasks {
  List<Task> listTask = [
    Task(
      id: 'p1',
      title: "di lam",
      done: false,
    ),
    Task(
      id: 'p2',
      title: "di an",
      done: false,
    ),
    Task(
      id: 'p3',
      title: "di ngu",
      done: false,
    ),
    Task(
      id: 'p4',
      title: "di choi",
      done: false,
    ),
  ];

  void addTask(Task task) {
    listTask.add(task);
  }

  void deleteTask(Task task) {
    listTask.remove(task);
  }

  sendData(task, bool done) {
    final newTask = Task(title: task, done: done);
    listTask.add(newTask);
  }

  findTask(String a) {
    for (int i = 0; i < listTask.length; i++) {
      if (listTask[i].title == a) {
        return listTask[i];
      }
    }
  }
}
