import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantappbywilsonoey/common/styles.dart';
import 'package:restaurantappbywilsonoey/data/api/api_service.dart';
import 'package:restaurantappbywilsonoey/data/model/Restaurant/ListRestaurant.dart';
import 'package:restaurantappbywilsonoey/ui/RestaurantDetailPage.dart';

import '../data/model/Provider/DatabaseProvider.dart';



class CardArticle extends StatelessWidget {
  final ListRestaurantItem article;

  const CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(article.id),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              color: primaryColor,
              child: ListTile(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Hero(
                  tag: article.pictureId,
                  child: Image.network(
                    ApiService.baseUrlImage + article.pictureId,
                    width: 100,
                  ),
                ),
                title: Text(
                  article.name,
                ),
                subtitle: Text(article.city),
                trailing: isBookmarked
                    ? IconButton(
                  icon: Icon(Icons.bookmark),
                  color: Theme.of(context).accentColor,
                  onPressed: () => provider.removeBookmark(article.id),
                )
                    : IconButton(
                  icon: Icon(Icons.bookmark_border),
                  color: Theme.of(context).accentColor,
                  onPressed: () => provider.addBookmark(article),
                ),
                onTap: () => Navigator.pushNamed(
                  context,
                  RestaurantDetailPage.routeName,
                  arguments: article,
                ),
              ),
            );
          },
        );
      },
    );
  }

}
