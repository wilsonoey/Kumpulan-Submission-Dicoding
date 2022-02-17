import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wisatabandung/detail_screen.dart';
import 'package:wisatabandung/model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => NewsListPage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
          article: ModalRoute.of(context)?.settings.arguments as RestaurantPlace,
        ),
        ArticleWebView.routeName: (context) => ArticleWebView(
          url: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder<String>(
        future:
        DefaultAssetBundle.of(context).loadString('lib/model/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<RestaurantPlace> articles = parceRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, RestaurantPlace article) {
    return ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        article.pictureId,
        width: 100,
      ),
      title: Text(article.name),
      subtitle: Text(article.city),
      onTap: () {
        Navigator.pushNamed(context, ArticleDetailPage.routeName,
            arguments: article);
      },
    );
  }
}