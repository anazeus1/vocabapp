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
    if (counter >= numberOfWords) {
      return Center(child: Text("no more worlds"));
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${words[counter].english}",
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
                          germanWord = words[counter].german;
                          if (germanWord == Guess.text) {
                            colorGerman = Colors.green;
                          } else {
                            colorGerman = Colors.red;
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
                          counter += 1;
                          germanWord = "";
                          Guess.text = "";
                        });
                      },
                      child: Text("Next word")),
                ),
              ],
            ),
          )
        ],
      );
    }
  }
}
