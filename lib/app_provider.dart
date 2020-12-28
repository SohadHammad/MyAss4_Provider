import 'package:flutter/material.dart';
import 'package:ass4_provider/Task.dart';

class appProvider extends ChangeNotifier {
  List<TaskSheet> tasks;
  setTasks(tasks) {
    this.tasks = tasks;
    notifyListeners();
  }
}