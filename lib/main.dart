import 'package:elt/ui/chapter-view.dart';
import 'package:elt/ui/chapter-list-view.dart';
import 'package:elt/ui/character-list-view.dart';
import 'package:flutter/material.dart';

import 'ui/campaign-list-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightGreen[800],
        accentColor: Colors.lightGreenAccent,

        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CampaignListView(),
        ChapterListView.ROUTE: (context) => ChapterListView(context),
        ChapterView.ROUTE: (context) => ChapterView(context),
        CharacterListView.ROUTE: (context) => CharacterListView(context)
      },
    );
  }
}
