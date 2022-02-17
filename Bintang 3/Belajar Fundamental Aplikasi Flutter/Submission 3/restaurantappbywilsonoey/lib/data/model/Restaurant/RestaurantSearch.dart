import 'ListRestaurant.dart';

class RestaurantSearch {
  RestaurantSearch({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<ListRestaurantItem> restaurants;

  factory RestaurantSearch.fromJson(Map<String, dynamic> json) =>
      RestaurantSearch(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<ListRestaurantItem>.from(
            json["restaurants"].map((x) => ListRestaurantItem.fromJson(x))),
      );
}