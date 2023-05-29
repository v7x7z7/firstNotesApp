import 'package:flutter/material.dart';
import 'package:lesson4/ui/pages/change_notes_page/change_notes_page.dart';

import '../pages/add_notes_page/add_notes_page.dart';
import '../pages/error404page/error_404_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/search_page/search_page.dart';
import 'app_routes.dart';

class AppNavigator {
  static String initRoute = AppRoutes.home;

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.home: (_) => const HomePage(),
      AppRoutes.addNotes: (_) => const AddNotesPage(),
      AppRoutes.changeNotes: (_) => const ChangeNotesPage(),
      AppRoutes.searchNotes: (_) => const SearchPage(),
    };
  }

  static Route generate(RouteSettings settings) {
    final settings0 = RouteSettings(
      name: '/404',
      arguments: settings.arguments,
    );

    return MaterialPageRoute(
      settings: settings0,
      builder: (_) => const Error404Page(),
    );
  }
}
