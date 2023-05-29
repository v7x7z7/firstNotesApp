import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/notes_provider.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_styles.dart';

class ChangeNotesPage extends StatelessWidget {
  const ChangeNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Изменить заметку ',
          style: AppStyles.fontStyle,
        ),
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
      ),
      body: const ChangeNotesBody(),
    );
  }
}

class ChangeNotesBody extends StatelessWidget {
  const ChangeNotesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    final arg = ModalRoute.of(context)?.settings.arguments;
    final int index = arg is int ? arg :0;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          TextFormFieldWidget(
            labelText: 'Заголовок',
            hintText: '',
            textEditingController: model.titleController,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            labelText: 'Заметки',
            hintText: '',
            textEditingController: model.textController,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(
              heroTag: 'notes-add-btn',
              backgroundColor: AppColors.backgroundColor,
              elevation: 2,
              onPressed: () {
                model.changeNotes(context, index);
              },
              label: Text(
                'Изменить',
                style: AppStyles.fontStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purpleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
  });

  final String labelText, hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyles.fontStyle.copyWith(
          fontSize: 12,
          color: AppColors.textColor,
        ),
        hintText: hintText,
        hintStyle: AppStyles.fontStyle.copyWith(
          fontSize: 16,
          color: AppColors.blackColor,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.formColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
