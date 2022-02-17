import 'dart:convert';

class RestaurantPlace {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Menu menu;

  RestaurantPlace({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menu
  });

  RestaurantPlace.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'].toDouble();
    menu = (restaurant['menus'] != null
        ? new Menu.fromJson(restaurant['menus'])
        : null)!;
  }
}
class Menu {
  late List<String> foods;
  late List<String> drinks;
  Menu({required this.foods, required this.drinks});
  Menu.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <String>[];
      json['foods'].forEach((v) {
        foods.add(v['name']);
      });
    }
    if (json['drinks'] != null) {
      drinks = <String>[];
      json['drinks'].forEach((v) {
        drinks.add(v['name']);
      });
    }
  }
}


List<RestaurantPlace> parceRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => RestaurantPlace.fromJson(json)).toList();
}

