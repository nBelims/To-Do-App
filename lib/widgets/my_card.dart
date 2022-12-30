import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/task.dart';
import 'package:intl/intl.dart';

class MyCard extends StatefulWidget {
  Task task;

  Function deleteTask;

  Function updateTask;

  MyCard(this.task, this.deleteTask, this.updateTask);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // update task
        widget.updateTask();
      },
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 20,
                  top: 25,
                ),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: widget.task.color,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 25,
              top: 25,
            ),
            child: Slidable(
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (context) {
                    // delete tasks
                    widget.deleteTask(widget.task);
                  },
                  icon: Icons.delete,
                  backgroundColor: Colors.transparent,
                )
              ]),
              child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Checkbox(
                        activeColor: widget.task.color,
                        onChanged: (value) {
                          // press checkbox
                          setState(() {
                            widget.task.changeDone();
                          });
                        },
                        value: widget.task.done,
                      ),
                      title: Text(widget.task.title,
                          style: TextStyle(
                            fontSize: 18,
                            decoration: widget.task.done
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          )),
                      trailing:
                          Text(DateFormat('kk:mm').format(widget.task.date!)),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
