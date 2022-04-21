import 'package:flutter/material.dart';
import 'package:vocabapp/model/worte.dart';
import 'package:vocabapp/page/home.dart';
import 'dart:io';
import 'package:flutter/src/material/about.dart';

class AddWord extends StatefulWidget {
  @override
  final Storage storage;
  AddWord({required Key key, required this.storage}) : super(key: key);
  State<AddWord> createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  late String state;
  final englishWord = TextEditingController();
  final germanWord = TextEditingController();
  final article = TextEditingController();
  final plural = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.storage.readData().then((String value) {
      setState(() {
        state = value;
      });
    });
  }

  Future<File> writeData() async {
    setState(() {
      state = englishWord.text;
      englishWord.text = "";
    });
    return widget.storage.writeData(state);
  }

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
          ElevatedButton(onPressed: writeData, child: const Text("Add word")),
          Text('${state ?? "file is empty"}'),
          FutureBuilder<Directory>(builder:
              (BuildContext context, AsyncSnapshot<Directory> snapshot) {
            Text text = Text('');
            if (snapshot.hasError) {
              text = Text("Error ${snapshot.error}");
            } else if (snapshot.hasData) {
              text = Text('path:${snapshot.data?.path}');
            } else {
              text = Text("Unavaible");
            }
            return new Container(
              child: text,
            );
          })
        ],
      )),
    );
  }

  void AddWord(english, german, article, plural) {
    words.add(Word(english, german, article, plural));
  }
}
