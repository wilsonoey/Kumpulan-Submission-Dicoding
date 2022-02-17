import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurantappbywilsonoey/data/model/Restaurant/ListRestaurant.dart';
import 'package:restaurantappbywilsonoey/data/model/Restaurant/RestaurantDetail.dart';
import 'package:restaurantappbywilsonoey/data/model/Restaurant/RestaurantSearch.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String baseUrlImage =
      'https://restaurant-api.dicoding.dev/images/small/';
  static final String _list = 'list';
  static final String _detail = 'detail/';
  static final String _search = 'search';
  static final String _review = 'review';

  Future<ListRestaurant> getListRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + _list));
    if (response.statusCode == 200) {
      return ListRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load List Restaurant');
    }
  }
  Future<RestaurantDetail> getDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + _detail + id));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Detail Restaurant');
    }
  }
  Future<RestaurantSearch> getSearchRestaurant(String text) async {
    final response = await http.get(Uri.parse(_baseUrl + "$_search?q=$text"));
    if (response.statusCode == 200) {
      return RestaurantSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
  Future<bool> postReview(ConsumerReviewPost data) async {
    final response = await http.post(Uri.parse(_baseUrl + _review),
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


