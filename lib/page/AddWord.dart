import 'package:flutter/material.dart';
import 'package:vocabapp/model/word.dart';
import 'package:vocabapp/boxes.dart';

class AddWord extends StatefulWidget {
  @override
  State<AddWord> createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  final englishWord = TextEditingController();
  final germanWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add word'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: englishWord,
              decoration: const InputDecoration(labelText: "Word in English"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: germanWord,
              decoration: const InputDecoration(labelText: "Word in German"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addword(englishWord.text, germanWord.text);
                englishWord.clear();
                germanWord.clear();
              },
              child: const Text("Add word")),
        ],
      )),
    );
  }

  Future addword(String english, String german) async {
    final word = Word();
    word.english = english;
    word.german = german;
    final box = Boxes.getWords();
    box.add(word);
  }
}
