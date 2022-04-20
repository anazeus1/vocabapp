import 'package:hive/hive.dart';
part 'word.g.dart';

@HiveType(typeId: 0)
class Word {
  @HiveField(0)
  late String english;

  @HiveField(1)
  late String german;
}
