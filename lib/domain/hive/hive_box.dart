import 'package:hive/hive.dart';
import 'package:lesson4/domain/hive/notes_data.dart';

abstract class HiveBoxes {
  static final Box<NotesData> notes = Hive.box<NotesData>('notes');
}