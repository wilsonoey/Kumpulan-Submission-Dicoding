import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wisatabandung/model/tourism_place.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final RestaurantPlace article;
  const ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Image.network(article.pictureId),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Text(
                    article.description,
                  ),
                  Divider(color: Colors.grey),
                  Text('Kota : ${article.city}'),
                  SizedBox(height: 10),
                  Text('Rating : ${article.rating}'),
                  Divider(color: Colors.grey),
              ],
              ),
            ),
            _buildDrawer(),
          ],
        ),
      ),
    );
  }
  Widget _buildDrawer() {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Food'),
          ),
          SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: article.menu.foods.length,
                itemBuilder: (context, index) => ListTile(
                  subtitle: Text(article.menu.foods[index]),
                ),
              ),
          ),
          ListTile(
            leading: Icon(Icons.local_drink),
            title: Text('Drink'),
          ),
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: article.menu.drinks.length,
              itemBuilder: (context, index) => ListTile(
                subtitle: Text(article.menu.drinks[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';

  final String url;

  const ArticleWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}


