import 'package:hive/hive.dart';

class ToDoDatabase{

  List toDoList = [];

//   reference the box
final _myBox = Hive.box("mybox");

// run this method on the first time of opening the app
void createInitialData(){
  toDoList = [
  ["Complete tutorial", false],
  ["Something else", false],

  ];
}

// load data from database
void loadData(){
  toDoList = _myBox.get("TODOLIST");
}

// update the database
void updateDatabase(){
  _myBox.put("TODOLIST", toDoList);

}

}