// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vocabapp/model/lesson.dart';

import 'package:vocabapp/model/worte.dart';
import 'package:vocabapp/page/TestList.dart';
import 'package:vocabapp/page/TestYourself.dart';

// ignore: must_be_immutable
class WordList extends StatelessWidget {
  Lesson selectedLesson;
  Color lessonColor;
  String lessonName;

  // ignore: use_key_in_widget_constructors
  WordList(
      {required this.selectedLesson,
      required this.lessonColor,
      required this.lessonName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(lessonName),
          backgroundColor: lessonColor,
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      selectedLesson.wrongWords = {};
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestList(
                                    selectedLesson: selectedLesson,
                                    lessonColor: lessonColor,
                                  )));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(lessonColor),
                    ),
                    child: const Text('test yourself'))),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: selectedLesson.words.length,
                itemBuilder: (BuildContext context, int index) {
                  final word = selectedLesson.words[index];

                  return buildWord(context, word);
                },
              ),
            ),
          ],
        ));
  }

  Widget buildWord(
    BuildContext context,
    Word word,
  ) {
    String? text;

    if (word.type == "Noun") {
      text = word.article + " " + word.german + " | die " + word.plural;
    } else if (word.type == "Verb") {
      text = word.german + " | " + word.article + " " + word.plural;
    } else {
      text = word.german;
    }
    return Card(
      color: Colors.white,
      child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          title: Text(
            word.english,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          trailing: Text(text)),
    );
  }
}
