import 'package:flutter/material.dart';
import 'package:test_projet_2/Controller/ArticleController.dart';
import 'package:test_projet_2/Vues/ArticleScreen.dart';
import 'package:test_projet_2/Vues/UnknownRoutePage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>ArticleController(),
       
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => UnknownRoutePage()
        );
      },
    );
  }
}









