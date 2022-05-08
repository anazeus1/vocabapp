// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vocabapp/helpers/utils.dart';
import 'package:vocabapp/page/lessonList.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class LevelList extends StatelessWidget {
  var levels = Utils.getLevels();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Levels"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: levels.length,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                    child: Text(
                      levels[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LessonList(
                                    lessons: levels[index].lessons,
                                    levelColor: levels[index].color,
                                    levelName: levels[index].name,
                                  )));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            levels[index].color)));
              }),
        ),
      ),
    );
  }
}
