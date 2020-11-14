import 'package:flutter/material.dart';
import 'package:github_search/screen/github_screen.dart';


class AppRoute {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
       switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (_) => GithubScreen());
    }
  }
}
