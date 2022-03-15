import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/add_task.dart';

class TasksProvider extends ChangeNotifier{

  List<AddTask> _taskList=[];

  void  addTask(AddTask addTask){
    _taskList.add(addTask);
    notifyListeners();
  }
 List<AddTask> get getList{
    return _taskList;
  }
  void deleteItem (String item){
    item!=null?_taskList.removeWhere((element) => element.description==item):null;
    notifyListeners();
  }
}