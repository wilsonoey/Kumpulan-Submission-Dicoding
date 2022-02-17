class ListRestaurant {
  ListRestaurant({
    required this.error,
    required this.status,
    required this.totalResults,
    required this.restaurants,
  });

  bool error;
  String status;
  int totalResults;
  List<ListRestaurantItem> restaurants;

  factory ListRestaurant.fromJson(Map<String, dynamic> json) => ListRestaurant(
    error: json["error"],
    status: json["message"],
    totalResults: json["count"],
    restaurants: List<ListRestaurantItem>.from(json["restaurants"].map((x) => ListRestaurantItem.fromJson(x))),
      );
}

class ListRestaurantItem {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  ListRestaurantItem({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory ListRestaurantItem.fromJson(Map<String, dynamic> json) => ListRestaurantItem(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
  );
}
