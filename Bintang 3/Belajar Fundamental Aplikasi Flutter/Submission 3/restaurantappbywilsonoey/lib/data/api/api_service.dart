import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurantappbywilsonoey/data/model/Restaurant/ListRestaurant.dart';
import 'package:restaurantappbywilsonoey/data/model/Restaurant/RestaurantDetail.dart';
import 'package:restaurantappbywilsonoey/data/model/Restaurant/RestaurantSearch.dart';

class ApiService {
  static final String baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String baseUrlImage =
      'https://restaurant-api.dicoding.dev/images/small/';
  static final String list = 'list';
  static final String detail = 'detail/';
  static final String search = 'search';
  static final String review = 'review';

  Future<ListRestaurant> getListRestaurant() async {
    final response = await http.get(Uri.parse(baseUrl + list));
    if (response.statusCode == 200) {
      return ListRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load List Restaurant');
    }
  }
  Future<RestaurantDetail> getDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse(baseUrl + detail + id));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Detail Restaurant');
    }
  }
  Future<RestaurantSearch> getSearchRestaurant(String text) async {
    final response = await http.get(Uri.parse(baseUrl + "$search?q=$text"));
    if (response.statusCode == 200) {
      return RestaurantSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Search Restaurant');
    }
  }
  Future<bool> postReview(ConsumerReviewPost data) async {
    final response = await http.post(Uri.parse(baseUrl + review),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'X-Auth-Token': '12345',
      },
      body: jsonEncode(data.toJson()),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to post review');
    }
  }
}


