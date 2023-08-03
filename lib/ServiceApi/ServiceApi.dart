import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_projet_2/Model/Article.dart';

class ServiceApi {
  //9482f6ab57a94f10b9c4e6d158b501d8
  static const String apiKey = "9482f6ab57a94f10b9c4e6d158b501d8"; // Remplacez par votre clé API
  static const String url = "https://newsapi.org/v2/everything?q=Apple&apiKey=$apiKey";

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> articlesJson = map['articles'];
      return articlesJson.map((json) => Article.fromJson(json))
          .where((article) => article.urlToImage != null)
          .take(20)
          .toList();
    } else {
      throw Exception('echec de  recupration des donnees');
    }
  }
}
