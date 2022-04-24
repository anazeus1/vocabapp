import 'package:flutter/material.dart';
import 'package:vocabapp/model/worte.dart';

class AddWord extends StatefulWidget {
  @override
  State<AddWord> createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  late String state;
  final englishWord = TextEditingController();
  final germanWord = TextEditingController();
  final article = TextEditingController();
  final plural = TextEditingController();

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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flexible(
                  child: TextField(
                    controller: germanWord,
                    decoration:
                        const InputDecoration(labelText: "Word in German"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flexible(
                  child: TextField(
                    controller: article,
                    decoration: const InputDecoration(labelText: "article"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flexible(
                  child: TextField(
                    controller: plural,
                    decoration:
                        const InputDecoration(labelText: "plural ending"),
                  ),
                ),
              )
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Add word")),
        ],
      )),
    );
  }

  void AddWord(english, german, article, plural) {
    words.add(Word(english, german, article, plural));
  }
}
