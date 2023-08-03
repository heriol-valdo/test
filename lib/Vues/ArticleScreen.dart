import 'package:flutter/material.dart';
import 'package:test_projet_2/Model/Article.dart';
import 'package:test_projet_2/Style/StyleTitle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ArticleScreen extends StatelessWidget {
  final Future<List<Article>> article;

  ArticleScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
             alignment: Alignment.centerLeft,
             margin: EdgeInsets.fromLTRB(12, 20, 0, 15),
             child: Text("News",style: StyleTitle.titleStyle,),
          ),
          
          Expanded(
            child: FutureBuilder<List<Article>>(
            future: article,
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
            }else if (snapshot.hasError) {
              return Text('Erreur: ${snapshot.error}');
            } else if (snapshot.hasData) {
               final articles = snapshot.data!;

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
            final article = articles[index];

            return CachedNetworkImage(
              imageUrl: article.urlToImage!,
              imageBuilder: (context, imageProvider) => ListTile(
                title: Text(article.title, style: StyleTitle.titleArticle),
                subtitle: Text(article.description),
                trailing: Image(image: imageProvider), // Image à droite
                onTap: () => launch(article.url),
              ),
              placeholder: (context, url) => SizedBox.shrink(),
              errorWidget: (context, url, error) => SizedBox.shrink(),
            );
          },
        );
      } else {
           return Text('Echec lors de la recupration des donnees ');
       }
        },
      ),
    )


        ],
      ),
    );
  }
}
