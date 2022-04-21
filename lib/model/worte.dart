import 'package:vocabapp/page/wrongWords.dart';
import 'package:flutter/material.dart';

class Word {
  String english;
  String german;
  String article;
  String plural;

  Word(this.english, this.german, this.article, this.plural);
}

var wrongWords = [];

var words = [
  Word("Task", "Aufgabe", "die", "-n"),
  Word("dog", "Hund", "der", "-e"),
  Word("cat", "katze", "die", "-n"),
  Word("School", "Schule", "die", "-n"),
  Word("Semester", "Semester", "der", "-"),
  Word("Computer", "Computer", "der", "-s")
];

class jobs extends StatefulWidget {
  const jobs({Key? key}) : super(key: key);

  @override
  State<jobs> createState() => _jobsState();
}

class _jobsState extends State<jobs> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
