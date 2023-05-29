import 'package:flutter/material.dart';
import 'package:lesson4/domain/hive/notes_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../hive/hive_box.dart';

class NotesProvider extends ChangeNotifier {

  NotesProvider(){
    getTheme();
  }

  // controllers

  final titleController = TextEditingController();
  final textController = TextEditingController();

  bool isLightTheme = false;
  // изменение темы
  changeTheme() async{
    isLightTheme = !isLightTheme; // ! isLightTheme - переопределяет переменную на противоположную
    final pref = await SharedPreferences.getInstance(); // загружает и анализирует sharedPreferences для приложения
    await pref.setBool('theme', isLightTheme);
    notifyListeners();
  }

  // метод получения сохраненных данных из SharedPreferences
  getTheme() async{
    final pref = await SharedPreferences.getInstance();
    isLightTheme = pref.getBool('theme') ?? isLightTheme;
    notifyListeners();
  }

  // add notes

  Future<void> onAddNotes(BuildContext context) async {
    await HiveBoxes.notes
        .add(
          NotesData(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : 'Заметки',
            text: textController.text.isNotEmpty
                ? textController.text
                : 'Заметки',
          ),
        )
        .then((value) => controllerClear())
        .then(
          (value) => Navigator.pop(context),
        );
  }

  //clear controller
  controllerClear() {
    titleController.clear();
    textController.clear();
  }

  //delete notes
  Future<void> onDeleteNote(BuildContext context, int index) async {
    await HiveBoxes.notes.deleteAt(index).then(
          (value) => Navigator.pop(context),
        );
  }

// Метод изменения заметок
  Future<void> changeNotes(BuildContext context, int index) async {
    await HiveBoxes.notes
        .putAt(
          index,
          NotesData(
            title: titleController.text,
            text: textController.text,
          ),
        )
        .then(
          (value) => Navigator.pop(context),
        );
  }

  // установка значений в поля ввода при редактировании
  void setControllers(int index) async {
    titleController.text = HiveBoxes.notes.getAt(index)?.title ?? 'Заголовок';
    textController.text = HiveBoxes.notes.getAt(index)?.text ?? 'Заметки';
  }
}
