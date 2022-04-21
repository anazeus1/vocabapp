import 'package:flutter/material.dart';
import 'package:vocabapp/page/AddWord.dart';
import 'package:vocabapp/page/home.dart';
import 'package:vocabapp/page/TestYourself.dart';
import 'package:vocabapp/page/wordList.dart';
import 'package:vocabapp/page/wrongWords.dart';
import 'dart:async';
import 'dart:io';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    routes: {
      "/": (context) => Home(),
      "/AddWord": (context) => AddWord(
            storage: Storage(),
            key: Key("o"),
          ),
      "/WordList": (context) => WordList(),
      "/TestYourself": (context) => TestYourself(),
      "/wrongWords": (context) => WrongWords(),
    },
  ));
}
