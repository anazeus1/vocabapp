import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:vocabapp/model/word.dart';
import 'package:vocabapp/page/AddWord.dart';
import 'package:vocabapp/page/home.dart';
import 'package:vocabapp/page/TestYourself.dart';
import 'package:vocabapp/page/wordList.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordAdapter());

  await Hive.openBox<Word>('words');
  runApp(MaterialApp(
    routes: {
      "/": (context) => Home(),
      "/AddWord": (context) => AddWord(),
      "/WordList": (context) => WordList(),
      "/TestYourself": (context) => TestYourself(),
    },
  ));
}
