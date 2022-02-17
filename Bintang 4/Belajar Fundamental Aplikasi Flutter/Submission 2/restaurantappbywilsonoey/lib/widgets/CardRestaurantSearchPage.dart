import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantappbywilsonoey/common/styles.dart';
import 'package:restaurantappbywilsonoey/data/api/api_service.dart';
import 'package:restaurantappbywilsonoey/ui/RestaurantDetailPage.dart';

import '../data/model/Restaurant/ListRestaurant.dart';

class CardRestaurantSearchPage extends StatelessWidget {
  final ListRestaurantItem? restaurantSearchItems;
  const CardRestaurantSearchPage({required this.restaurantSearchItems});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: restaurantSearchItems!.pictureId,
          child: Image.network(
            ApiService.baseUrlImage + restaurantSearchItems!.pictureId,
            width: 100,
          ),
        ),
        title: Text(
          restaurantSearchItems!.name,
        ),
        subtitle: Text(restaurantSearchItems!.city),
        onTap: () => Navigator.pushNamed(
          context,
          RestaurantDetailPage.routeName,
          arguments: restaurantSearchItems,
        ),
      ),
    );
  }
}