// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vocabapp/model/lesson.dart';
import 'package:vocabapp/model/Test.dart';

import 'package:vocabapp/page/wrongWords.dart';

// ignore: must_be_immutable
class TestYourself extends StatefulWidget {
  String test;
  Lesson lesson;
  Color lessonColor;
  // ignore: use_key_in_widget_constructors
  TestYourself(
      {required this.lesson, required this.lessonColor, required this.test});
  @override
  State<TestYourself> createState() => _TestYourselfState();
}

class _TestYourselfState extends State<TestYourself> {
  late var test = widget.test;
  late var words = widget.lesson.words;
  late var lessonColor = widget.lessonColor;
  late var wrongWords = widget.lesson.wrongWords;

  late int numberOfWords = words.length;
  int counter = 0;
  late int lastcounter;

  final guess = TextEditingController();
  String germanWord = "";

  Color colorGerman = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(test),
          backgroundColor: lessonColor,
        ),
        body: buildContent(words));
  }

  Widget buildContent(words) {
    if (counter >= numberOfWords - 1) {
      if (wrongWords.isEmpty) {
        return const Center(
            child: Text(
          "Good job",
          style: TextStyle(color: Colors.green),
        ));
      } else {
        return WrongWords(context, wrongWords);
      }
    } else {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "${words[counter].english}",
          style: TextStyle(color: lessonColor, fontSize: 25),
        ),
        Divider(
          color: lessonColor,
          height: 16,
          indent: 20,
          endIndent: 20,
        ),
        Text(
          germanWord,
          style: TextStyle(color: colorGerman, fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: guess,
            style: const TextStyle(fontSize: 25),
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
                      if ((test == "Wortschatz")) {
                        germanWord = words[counter].german;
                      } else if (words[counter].type == "Verb") {
                        germanWord = words[counter].german;
                      } else {
                        germanWord = words[counter].german;
                      }
                      if (germanWord == guess.text) {
                        colorGerman = Colors.green;
                      } else {
                        colorGerman = Colors.red;
                        wrongWords.add(words[counter]);
                      }
                    });
                  },
                  child: const Text("Guess"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(lessonColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (guess.text == "") {
                          wrongWords.add(words[counter]);
                        }
                        print(counter);
                        if (test == "Plural" || test == "Artikel") {
                          while (words[counter].type != "Noun") {
                            print(counter);
                            counter = counter + 1;
                            lastcounter = counter;
                          }
                          print(lastcounter);
                          if (lastcounter == counter) {
                            counter = counter + 1;
                            lastcounter = counter;
                          }
                        } else if (test == "Konjugation") {
                          while (words[counter].type != "Verb") {
                            counter = counter + 1;
                          }
                        } else {
                          counter = counter + 1;
                        }

                        germanWord = "";

                        guess.text = "";
                      });
                    },
                    child: const Text("Next word"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(lessonColor))),
              ),
            ],
          ),
        ),
      ]);
    }
  }
}
