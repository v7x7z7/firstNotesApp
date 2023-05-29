import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lesson4/domain/hive/hive_box.dart';
import 'package:lesson4/domain/hive/notes_data.dart';
import 'package:lesson4/ui/widgets/card_widget.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  var filterNotes = <NotesData>[];
  final _notes = HiveBoxes.notes.values.toList();

  Future<void> deleteText() async {
    searchController.clear();
  }

  void searchNotes(){
    final query = searchController.text;
    if (query.isNotEmpty) {
      filterNotes = _notes.where((NotesData notesList) {
        return notesList.title.toLowerCase().contains(query.toLowerCase
          ()) || notesList.text.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }else{
      filterNotes = _notes;
    }
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    filterNotes = _notes;
    searchController.addListener(searchNotes);
        // () {searchNotes();}
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        // title: const Text(
        //   'Поиск',
        //   style: AppStyles.fontStyle,
        // ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
        title: TextField(
          controller: searchController,
          cursorColor: AppColors.blackColor,
          style: AppStyles.fontStyle,
          decoration: const InputDecoration(
            hintStyle: AppStyles.fontStyle,
            hintText: 'Поиск...',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: deleteText,
            icon: const Icon(
              Icons.close,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, Box<NotesData> box, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
              itemBuilder: (context, index){
                final note = filterNotes[index];
                return CardWidget(
                  title: note.title,
                  date: note.date ?? '0',
                  text: note.text,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 16,),
              itemCount: filterNotes.length,
          );
        },
      ),
      // body: const SearchNotesBody(),
    );
  }
}
//
// class SearchNotesBody extends StatelessWidget {
//   const SearchNotesBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final model = Provider.of<NotesProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 16,
//       ),
//       child: Column(
//         children: [
//           TextFormFieldWidget(
//             labelText: 'Поиск',
//             hintText: '',
//             textEditingController: model.titleController,
//           ),
//           const SizedBox(height: 16),
//           const SizedBox(height: 16),
//           SizedBox(
//             width: double.infinity,
//             child: FloatingActionButton.extended(
//               heroTag: 'notes-add-btn',
//               backgroundColor: AppColors.backgroundColor,
//               elevation: 2,
//               onPressed: () {
//                 // model.changeNotes(context, index);
//               },
//               label: Text(
//                 'Поиск',
//                 style: AppStyles.fontStyle.copyWith(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.purpleColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
