import 'package:flutter/material.dart';
import 'package:ass4_provider/DataBase/DataBaseHelper.dart';
import 'package:ass4_provider/screens/AllTasks.dart';
import 'package:ass4_provider/screens/CompleteTasks.dart';
import 'package:ass4_provider/screens/InCompleteTasks.dart';
import 'package:ass4_provider/modelSheet.dart';

class HomePage extends StatelessWidget {
  var db = DBHelper();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

        length: 3,
        child: Scaffold(
          // drawer is empty : 
            drawer: Drawer(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.pink,
              onPressed: () {
                showModalBottomSheet(
                 context: context,
                   builder: (context) => ModalSheet(),
              elevation: 7.0);
              },
              child: Icon(Icons.add),
            ),
            appBar: AppBar(
              backgroundColor: Colors.pink,
              title: Text('Todo App'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'All Tasks',
                  ),
                  Tab(
                    text: 'complete Tasks',
                  ),
                  Tab(
                    text: 'incomplete  Tasks',
                  )
                ],
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: [AllTasks(), CompleteTasks(), InCompleteTasks()],
            )));
  }
}
