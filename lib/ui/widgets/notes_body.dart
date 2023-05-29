import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lesson4/domain/hive/hive_box.dart';
import 'package:lesson4/domain/hive/notes_data.dart';
import 'package:lesson4/domain/providers/notes_provider.dart';
import 'package:provider/provider.dart';

import 'card_widget.dart';
import 'dialog_window_widget.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.notes.listenable(),
      builder: (context, Box<NotesData> notes, _) {
        final allNotes = notes.values.toList();
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: allNotes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                model.setControllers( index);
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    maxHeight: 180,
                    maxWidth: 380,
                  ),
                  context: context,
                  builder: (context) {
                    return DialogWindowWidget(
                      index: index,
                      title: allNotes[index].title,
                      text: allNotes[index].text,
                    );
                  },
                );
              },
              child: CardWidget(
                // index: index,
                title: allNotes[index].title,
                text: allNotes[index].text,
                date: allNotes[index].date ?? '',
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
        );
      },
    );
  }
}
