import 'package:flutter/material.dart';
import 'package:news_app/core/view_model/news.dart';
import 'package:news_app/core/view_model/theme.dart';
import 'package:news_app/presentation/views/home.dart';
import 'package:news_app/utils/constant/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(create: (context) => ThemeModel()),
        ChangeNotifierProvider<NewsProvider>(
            create: (context) => NewsProvider())
      ],
      child: Consumer<ThemeModel>(builder: (_, themeModel, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeModel.mode,
          theme: NewsAppTheme.lightThemeData(),
          darkTheme: NewsAppTheme.darkThemeData(),
          home: const HomePage(),
        );
      }),
    );
  }
}
