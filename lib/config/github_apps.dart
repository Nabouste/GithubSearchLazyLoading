import 'package:flutter/material.dart';
import 'package:github_search/config/route.dart';
import 'package:github_search/config/theme.dart';
import 'package:github_search/core/bloc/search_bloc.dart';
import 'package:provider/provider.dart';

class GithubApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchBloc>(
          create: (_) => SearchBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: AppRoute.navigatorKey,
        onGenerateRoute: AppRoute.onGenerateRoute,
        title: 'Github Search Apps',
        theme: AppTheme.light(context),
      ),
    );
  }
}
