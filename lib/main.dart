import 'package:flutter/material.dart';
import 'package:ass4_provider/app_provider.dart';
import 'package:ass4_provider/screens/Splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return appProvider();
    },
    child: MaterialApp(
      home: SplashScreen(),
    ),
  ));
}
