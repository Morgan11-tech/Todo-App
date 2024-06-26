import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
   TodoTile({super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
     required this.editFunction,
   });

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;
  final VoidCallback editFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: GestureDetector(
        onTap:
          editFunction,
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),

          child: Container(

            decoration: BoxDecoration(color: Color(0xffffc8dd),
            borderRadius: BorderRadius.circular(12)),

            child: Row(
              children: [
                Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                  activeColor: Colors.black,

                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                      taskName,
                    style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
