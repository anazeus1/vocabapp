import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vocabapp/boxes.dart';
import 'package:vocabapp/model/word.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WordList extends StatefulWidget {
  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word List"),
      ),
      body: ValueListenableBuilder<Box<Word>>(
          valueListenable: Boxes.getWords().listenable(),
          builder: (context, box, _) {
            final words = box.values.toList().cast<Word>();
            return ListView.builder(
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
            );
            ;
          }),
    );
  }

  /* Widget buildContent(List<Word> words) {
    if (words.isEmpty) {
      return Center(
        child: Text(
          'No words yet!',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      ListView.builder(
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
      );
    }
  }*/

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
          word.german,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
