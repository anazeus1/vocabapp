import 'package:flutter/material.dart';
import 'package:vocabapp/model/lesson.dart';

class Level {
  String name;
  List<Lesson> lessons;
  Color color;
  Level({required this.name, required this.lessons, required this.color});
}
