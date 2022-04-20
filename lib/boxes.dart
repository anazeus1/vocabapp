import 'package:hive/hive.dart';
import 'package:vocabapp/model/word.dart';

class Boxes {
  static Box<Word> getWords() => Hive.box<Word>("words");
}
