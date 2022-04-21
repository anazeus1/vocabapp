import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vocabapp/model/worte.dart';
import 'package:vocabapp/page/wrongWords.dart';

class TestYourself extends StatefulWidget {
  @override
  State<TestYourself> createState() => _TestYourselfState();
}

var selectedWord = words[0];

class _TestYourselfState extends State<TestYourself> {
  late int numberOfWords = words.length;
  var newWords = words.toList();
  int counter = 0;
  var rand = Random();

  final Guess = TextEditingController();
  String germanWord = "";
  Color colorGerman = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test yourself"),
        ),
        body: buildContent(words));
  }

  Widget buildContent(words) {
    if (newWords.length == 1) {
      return Center(child: Text("no more worlds"));
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${selectedWord.english}",
            style: TextStyle(color: Colors.blue, fontSize: 25),
          ),
          Divider(
            color: Colors.lightBlue,
            height: 16,
            indent: 20,
            endIndent: 20,
          ),
          Text(
            '$germanWord',
            style: TextStyle(color: colorGerman, fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: Guess,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          germanWord =
                              selectedWord.article + " " + selectedWord.german;

                          if (germanWord == Guess.text) {
                            colorGerman = Colors.green;
                          } else {
                            colorGerman = Colors.red;
                            wrongWords.add(selectedWord);
                            print(wrongWords.length);
                          }
                        });
                      },
                      child: Text("Guess")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          newWords.remove(selectedWord);
                          selectedWord =
                              newWords[rand.nextInt(newWords.length)];

                          germanWord = "";
                          Guess.text = "";
                        });
                      },
                      child: Text("Next word")),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wrongWords');
              },
              child: Text("Wrong words"))
        ],
      );
    }
  }
}
