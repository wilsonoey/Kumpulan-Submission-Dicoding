import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurantappbywilsonoey/data/api/api_service.dart';
import 'package:restaurantappbywilsonoey/data/model/Restaurant/RestaurantSearch.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantSearchProvider({required this.apiService});

  late RestaurantSearch? _restaurantsResult;
  String _message = '';
  String _query = '';
  late ResultState _state;

  String get message => _message;
  String get query => _query;

  RestaurantSearch? get result => _restaurantsResult;

  ResultState get state => _state;

  Future<dynamic> fetchAllRestaurant(String query) async {
    try {
      _state = ResultState.Loading;
      _query = query;


      final restaurantsp = await apiService.getSearchRestaurant(query);
      if (restaurantsp.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantsResult = restaurantsp;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return 'Error --> $e';
    }
  }
}