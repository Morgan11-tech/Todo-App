import 'package:flutter/material.dart';
import 'package:todo_app/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
   DialogBox({super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
      backgroundColor: Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height/6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
          SizedBox(height: 10,),

          //   Save and cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                    text: "Save", onPressed: onSave
                ),

                SizedBox(width: 8),
                MyButton(
                    text: "Cancel", onPressed: onCancel
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
