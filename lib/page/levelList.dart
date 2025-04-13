// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocabapp/helpers/utils.dart';
import 'package:vocabapp/main.dart';
import 'package:vocabapp/page/lessonList.dart';
import 'dart:async';


// ignore: must_be_immutable, use_key_in_widget_constructors
class LevelList extends StatelessWidget {

  late final StreamSubscription<AuthState> _authSubscription;

  var levels = Utils.getLevels();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 25.0,),
            ElevatedButton(onPressed: (){
              supabase.auth.signOut();
              Navigator.pushReplacementNamed(context, "/login");

            }, child: Text("logout")),
          ],
        ),
      ),
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
                        backgroundColor: WidgetStateProperty.all<Color>(
                            levels[index].color)));
              }),
        ),
      ),
    );
  }
}
