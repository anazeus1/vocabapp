// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vocabapp/model/lesson.dart';
import 'package:vocabapp/page/wordList.dart';

// ignore: must_be_immutable
class LessonList extends StatelessWidget {
  List<Lesson> lessons;
  Color levelColor;
  String levelName;
  // ignore: use_key_in_widget_constructors
  LessonList(
      {required this.lessons,
      required this.levelColor,
      required this.levelName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(levelName),
        backgroundColor: levelColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: lessons.length,
            itemBuilder: (BuildContext context, int index) {
              return ElevatedButton(
                child: Text(
                  lessons[index].name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WordList(
                                selectedLesson: lessons[index],
                                lessonColor: lessons[index].lessonColor,
                                lessonName: lessons[index].name,
                              )));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        lessons[index].lessonColor)),
              );
            }),
      ),
    );
  }
}
