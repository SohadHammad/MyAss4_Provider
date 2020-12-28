import 'package:ass4_provider/DataBase/DataBaseHelper.dart';

class TaskSheet {
  ////
  int id;
  String taskName;
  bool isComplete;
  TaskSheet({this.id, this.taskName, this.isComplete});

  // data to json :
  toJson() {
    return {
      DBHelper.columnId: this.id,
      DBHelper.columnName: this.taskName,
      DBHelper.columnIsComplete: this.isComplete ? 1 : 0
    };
  }

  // data from json :
  TaskSheet.fromJson(Map map) {
    this.taskName = map[DBHelper.columnName];
    this.id = map[DBHelper.columnId];
    this.isComplete = map[DBHelper.columnIsComplete] == 1 ? true : false;
  }
}