
import 'package:flutter/material.dart';
import 'package:vocabapp/model/lesson.dart';
import 'package:vocabapp/model/Test.dart';
import 'package:vocabapp/page/TestYourself.dart';

class TestList extends StatelessWidget {
  Color lessonColor;
  Lesson selectedLesson;

  TestList({required this.lessonColor, required this.selectedLesson});
  late var words = selectedLesson.words;

  List<String> tests = ["Wortschatz", "Artikel", "Plural", "Konjugation"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lessonColor,
          title: const Text("test yourself"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: tests.length,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(lessonColor)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TestYourself(
                                  test: tests[index],
                                  lesson: selectedLesson,
                                  lessonColor: lessonColor,
                                )));
                  },
                  child: Text(tests[index]),
                );
              }),
        ));
  }
}
