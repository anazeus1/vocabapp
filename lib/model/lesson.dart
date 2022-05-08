import 'package:vocabapp/model/worte.dart';
import 'package:flutter/material.dart';

class Lesson {
  String name;
  List<Word> words;
  Set<Word> wrongWords = {};
  Color lessonColor;

  Lesson({required this.name, required this.words, required this.lessonColor});
}
