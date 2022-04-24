import 'package:flutter/material.dart';

import 'package:vocabapp/model/worte.dart';

class WordList extends StatefulWidget {
  
  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  _WordListState(words)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Word List"),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: words.length,
          itemBuilder: (BuildContext context, int index) {
            final word = words[index];
            if (buildWord(context, word) == null) {
              return Text("7a7a");
            } else {
              return buildWord(context, word);
            }
          },
        ));
  }

  Widget buildWord(
    BuildContext context,
    Word word,
  ) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          word.english,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: Text(
          word.article + " " + word.german + " " + word.plural,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
