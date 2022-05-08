// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vocabapp/model/worte.dart';

// ignore: non_constant_identifier_names
Widget WrongWords(BuildContext context, Set<Word> wrongWords) {
  return Column(children: [
    const Center(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Wrong words",
        style: TextStyle(color: Colors.red),
      ),
    )),
    Expanded(
      child: ListView.builder(
          itemCount: wrongWords.length,
          itemBuilder: (context, index) {
            var text;
            var word = wrongWords.elementAt(index);
            if (word.type == "Noun") {
              text = word.article + " " + word.german + " | die " + word.plural;
            } else if (word.type == "Verb") {
              text = word.german + " | " + word.article + " " + word.plural;
            } else {
              text = word.german;
            }
            return Card(
              color: Colors.white,
              child: ExpansionTile(
                tilePadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                title: Text(
                  wrongWords.elementAt(index).english,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            );
          }),
    )
  ]);
}
