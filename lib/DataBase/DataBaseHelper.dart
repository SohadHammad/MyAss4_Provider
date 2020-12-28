import 'package:sqflite/sqflite.dart';
import 'package:ass4_provider/Task.dart';

class DBHelper {
  Database database;
  static final String dbName = '/toDoProvider.db';
  static final String tableName = 'myprovider';
  static final String columnId = 'id';
  static final String columnName = 'name';
  static final String columnIsComplete = 'iscomplete';

  Future<Database> initDataBase() async {
    if (database == null) {
      return await createDataBase();
    } else {
      return database;
    }
  }

  // function create :
  createDataBase() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = dbPath + dbName;
      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
            await db.execute(
                'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT , $columnName TEXT, $columnIsComplete INTEGER)');
          });
      return database;
    } catch (e) {
      print(e);
    }
  }

  // function insert :
  insertTask(TaskSheet task) async {
    try {
      database = await initDataBase();
      await database.insert(tableName, task.toJson());
    } catch (e) {
      print(e);
    }
  }

  // function get All user :
  Future<List<TaskSheet>> getAllTasks() async {
    try {
      database = await initDataBase();
      List<Map> myMap = await database.query(tableName);
      List<TaskSheet> tasks = myMap.map((e) => TaskSheet.fromJson(e)).toList();
      return tasks;
    } catch (e) {
      print(e);
    }
  }

  // function gettask type :
  Future<List<TaskSheet>> getTaskType(int isComplete) async {
    try {
      database = await initDataBase();
      List<Map> myMaps = await database.query(tableName,
          where: '$columnIsComplete=?', whereArgs: [isComplete]);
      List<TaskSheet> tasks = myMaps.map((e) => TaskSheet.fromJson(e)).toList();
      return tasks;
    } catch (e) {
      print(e);
    }
  }

  // function update task :
  updateTask(TaskSheet task) async {
    try {
      database = await initDataBase();
      database.update(tableName, task.toJson(),
          where: '$columnId=?', whereArgs: [task.id]);
    } catch (e) {}
  }

  // function delete task :
  deleteTask(int id) async {
    try {
      database = await initDataBase();
      database.delete(tableName, where: '$columnId=?', whereArgs: [id]);
    } catch (e) {}
  }
}