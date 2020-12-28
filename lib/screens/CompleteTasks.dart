import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ass4_provider/DataBase/DataBaseHelper.dart';
import 'package:ass4_provider/Task.dart';
import 'package:ass4_provider/app_provider.dart';

import 'HomePage.dart';

class CompleteTasks extends StatefulWidget {
  @override
  _CompleteTasksState createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  @override
  Widget build(BuildContext context) {
    var db = DBHelper();
    //////
    db.getTaskType(1).then((value) {
      Provider.of<appProvider>(context, listen: false).setTasks(value);
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<appProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.tasks.length,
              itemBuilder: (_, int position) {
                bool isComplete = false;
                if (value.tasks[position].isComplete) {
                  isComplete = true;
                } else {
                  isComplete = false;
                }
                return Container(
                  height: 70,
                  child: Center(
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          Widget cancelButton = FlatButton(
                            child: Text("Cancel"),
                            color: Colors.pink,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                          Widget continueButton = FlatButton(
                            child: Text("Yes"),
                            color: Colors.pink,
                            onPressed: () {
                              db.deleteTask(value.tasks[position].id);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                      (Route<dynamic> route) => false);
                            },
                          );

                          AlertDialog alert = AlertDialog(
                            title: Text("Delete Task?"),
                            content: Text("Are you want to delete this Task?"),
                            actions: [
                              cancelButton,
                              continueButton,
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.pink,
                        ),
                      ),
                      title: Text(value.tasks[position].taskName),
                      trailing: Checkbox(
                          activeColor: Colors.pink,
                          value: isComplete,
                          onChanged: (value1) {
                            db.updateTask(TaskSheet(
                              id: value.tasks[position].id,
                              taskName: value.tasks[position].taskName,
                              isComplete: value1,
                            ));
                            db.getTaskType(1).then((value) {
                              Provider.of<appProvider>(context, listen: false)
                                  .setTasks(value);
                            });
                          }),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}