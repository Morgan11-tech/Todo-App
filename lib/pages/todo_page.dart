import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/utilities/todo_list_tile.dart';

import '../utilities/edit_dialog_box.dart';

class ToDoPage extends StatefulWidget {
   ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  // reference the box
  final _myBox = Hive.box("mybox");

  // instance of ToDoDatabase
  ToDoDatabase db =ToDoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    // if this is the first time of using the app, create default data
    if (_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      // if some data already exists
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();


  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  // save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // create a new task
  void createNewTask (){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );

        });
  }


  // delete a task
  void deleteTask (int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }
  
  void editTask (int index){
    showDialog(
        context: context,
        builder: (context){
          return EditDialogBox(
            controller: _controller,
          );

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(

          backgroundColor: const Color(0xffcdb4db),
          title: const Text("TODO Application", style: TextStyle(fontWeight: FontWeight.normal),),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context) => deleteTask(index),
            editFunction: () => editTask(index),
          );
        },
      ),
    );
  }
}
