import 'package:flutter/material.dart';
import 'package:todo_v1/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get allTasks => _tasks;

  void addTask(String task){
    _tasks.add(Task(name: task));
    notifyListeners();
  }

  void toggleTask(Task task){
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}