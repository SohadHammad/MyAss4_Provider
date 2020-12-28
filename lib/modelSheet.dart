import 'package:flutter/material.dart';
import 'package:ass4_provider/DataBase/DataBaseHelper.dart';
import 'package:ass4_provider/Task.dart';
import 'package:ass4_provider/screens/HomePage.dart';

class ModalSheet extends StatefulWidget {
  @override
  _ModalSheetState createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  final db = DBHelper();

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    String newTaskTitle = "tasks";
    return Container(
      color: Color(0xFF787878),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100), topRight: Radius.circular(100)),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                TextField(
                  controller: controller,
                  autofocus: true,
                  cursorColor: Colors.pink,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    newTaskTitle = controller.text;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  color: Colors.pink,
                  onPressed: () {
                    db.insertTask(
                        TaskSheet(taskName: newTaskTitle, isComplete: false));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.black, fontSize: 23),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}