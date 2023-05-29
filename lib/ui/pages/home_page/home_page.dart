import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson4/domain/providers/notes_provider.dart';
import 'package:lesson4/ui/app_navigator/app_routes.dart';

import 'package:lesson4/ui/themes/app_colors.dart';
import 'package:lesson4/ui/themes/app_styles.dart';
import 'package:provider/provider.dart';

import '../../widgets/notes_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoSwitch(
          activeColor: const Color.fromRGBO(101, 196, 102, 1.0),
          trackColor: AppColors.lightGreyColor,
          thumbColor: AppColors.backgroundColor,
          // activeTrackColor: AppColors.lightGreyColor,
          // inactiveThumbColor: AppColors.backgroundColor,
          // inactiveTrackColor: AppColors.lightGreyColor,
          onChanged: (bool val) {
            model.changeTheme();
          },
          value: model.isLightTheme,
        ),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: const Text(
          'Заметки',
          style: AppStyles.fontStyle,
        ),
        centerTitle: true,
        // leading: CupertinoSwitch(
        //     value: valueSwitch,
        //     onChanged: (bool value) {
        //       setState(() {
        //         valueSwitch = value;
        //       });
        //     }),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, AppRoutes.searchNotes);
        //   },
        //   icon: const Icon(Icons.switch_access_shortcut),
        //   color: AppColors.textColor,
        // ),
        actions: [
          // ChangeThemeButtonWidget(),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchNotes);
            },
            icon: const Icon(Icons.search),
            color: AppColors.textColor,
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addNotes);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          backgroundColor: AppColors.backgroundColor,
          label: const Icon(
            Icons.create_outlined,
            color: AppColors.purpleColor,
          ),
        ),
      ),
      body: const NotesBody(),
    );
  }
}
