import 'package:flutter/material.dart';
import 'dart:math' as math;

class Task {
  String? id;
  String title;
  DateTime? date;
  bool done;
  Color? color;
  
  Task({
    this.id,
    required this.title,
    this.date,
    required this.done,
    this.color,
  }) {
    // id == null ? id = DateTime.now() : id = id;
    id ??= DateTime.now().toString();
    date ??= DateTime.now();
    color ??=
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  void changeDone() {
    done = !done;
  }
}
