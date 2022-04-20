import 'package:flutter/material.dart';
import 'AddWord.dart';
import 'package:vocabapp/boxes.dart';
import 'package:hive/hive.dart';
import 'package:vocabapp/model/word.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestYourself extends StatefulWidget {
  @override
  State<TestYourself> createState() => _TestYourselfState();
}

class _TestYourselfState extends State<TestYourself> {
  final originalWords = Boxes.getWords().values.toList().cast<Word>();
  late final words = originalWords.toList();

  late int numberOfWords = originalWords.length;
  int counter = 0;

  final Guess = TextEditingController();
  String germanWord = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test yourself"),
        ),
        body: buildContent(words));
  }

  Widget buildContent(words) {
    if (counter >= numberOfWords) {
      return Text("no more worlds");
    } else {
      return Column(
        children: [
          Text("${words[counter].english}"),
          Text('$germanWord'),
          TextField(
            controller: Guess,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      germanWord = words[counter].german;
                    });
                  },
                  child: Text("Guess")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter += 1;
                      germanWord = "";
                      Guess.text = "";
                    });
                  },
                  child: Text("Next word")),
            ],
          )
        ],
      );
    }
  }
}
