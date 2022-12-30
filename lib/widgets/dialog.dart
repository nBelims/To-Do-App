import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  TextEditingController inputText;
  Function onSave;
  Function onCancel;
  MyDialog(
    this.inputText,
    this.onSave,
    this.onCancel,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
            height: 120,
            child: Column(
              children: [
                TextField(
                    controller: inputText,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add a new task",
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          onSave();
                          Navigator.of(context).pop();
                        },
                        child: const Text("Save")),
                    ElevatedButton(
                        onPressed: () => onCancel, child: const Text("Cancel"))
                  ],
                )
              ],
            )));
  }
}
