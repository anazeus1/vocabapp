import 'package:flutter/material.dart';
import 'package:vocabapp/model/worte.dart';

class WrongWords extends StatefulWidget {
  @override
  State<WrongWords> createState() => _WrongWordsState();
}

class _WrongWordsState extends State<WrongWords> {
  @override
  Widget build(BuildContext context) {
    print(wrongWords.length);
    return Scaffold(
        appBar: AppBar(
          title: Text('Wrong words'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: wrongWords.length,
          itemBuilder: (BuildContext context, int index) {
            final word = wrongWords[index];
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
