import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ass4_provider/DataBase/DataBaseHelper.dart';
import 'package:ass4_provider/app_provider.dart';
import 'package:ass4_provider/screens/HomePage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = DBHelper();
    db.getAllTasks().then((value) {
      Provider.of<appProvider>(context, listen: false).setTasks(value);
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return HomePage();
        }));
      });
    });
    return Scaffold(
      body: Center(
          child: Container(
              height: 250,
              width: 250,
              child: Image.asset('images/tasks.png'))),
    );
  }
}
