import 'package:flutter/material.dart';
import 'package:test_projet_2/ServiceApi/ServiceApi.dart';
import 'package:test_projet_2/Vues/ArticleScreen.dart';

class ArticleController extends StatelessWidget {
     final serviceApi = ServiceApi();

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArticleScreen(serviceApi.fetchArticles()),
    );
  }

 }

