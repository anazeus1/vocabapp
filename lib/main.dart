import 'package:flutter/material.dart';
import 'package:vocabapp/page/TestList.dart';
import 'package:vocabapp/page/levelList.dart';
import 'package:vocabapp/page/splash.dart';
import 'package:vocabapp/page/TestList.dart';
import 'package:vocabapp/page/TestList.dart';

Future main() async {
  runApp(MaterialApp(
    home: LevelList(),
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.blue[150],
    ),
  ));
}
