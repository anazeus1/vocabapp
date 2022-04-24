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
  Word("Goethe Institute", "Goethe-Institut", "das", "-e"),
  Word("Class", "Klasse", "die", "-n"),
  Word("News", "Nachricht", "die", "-en"),
  Word("Term", "Semester", "das", "-"),
  Word("Language school", "Sprachenschule", "die", "-n"),
  Word("Test", "Test", "der", "-s"),
  Word("Type", "Typ", "der", "-en"),
  Word("Community school", "Volkshochschule", "die", "-n"),
  Word("to look at", "anschauen,", "hat", "angeschaut"),
  Word("to write down", "aufschreiben", "hat", "aufgeschrieben"),
  Word("to move", "bewegen (sich)", "hat", "sich bewegt"),
  Word("to correct", "korrigieren", "hat", "korrigiert"),
  Word("to solve", "lösen,", "hat", "gelöst"),
  Word("to notice", "merken (sich)", "hat sich", "gemerkt"),
  Word("Translate,", "übersetzen,", "hat", "übersetzt"),
  Word("to repeat", "wiederholen", "hat", "wiederholt"),
  Word("Present", "Gegenwart", "die", "-"),
  Word("past", "Vergangenheit", "die", "-"),
  Word("to plan", "planen,", "hat", "geplant"),
  Word("to fall in love", "verlieben (sich)", "hat", " sich verliebt"),
  Word("to Travel", "verreisen,", "ist", "verreist"),
  Word("possible", "möglich", "", ""),
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
