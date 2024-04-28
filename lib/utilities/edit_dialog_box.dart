import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/database.dart';

class EditDialogBox extends StatefulWidget {
  const EditDialogBox({super.key,
    required this.controller,
  });

  final controller;

  @override
  State<EditDialogBox> createState() => _EditDialogBoxState();
}

class _EditDialogBoxState extends State<EditDialogBox> {
  // reference the box
  final _myBox = Hive.box("mybox");

  // instance of ToDoDatabase
  ToDoDatabase db =ToDoDatabase();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
      backgroundColor: Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height/5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Edit task", style: TextStyle(fontSize: 22),),
            const SizedBox(height: 4),
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Edit Task",
          ),
        ),
            const SizedBox(height: 6),
            //   Save and cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              MaterialButton(
              onPressed: () {},
              child: Text("Save"),
              color: Color(0xffbde0fe),
            )
              ],
            )
          ],

        ),
      ),
    );
  }
}
