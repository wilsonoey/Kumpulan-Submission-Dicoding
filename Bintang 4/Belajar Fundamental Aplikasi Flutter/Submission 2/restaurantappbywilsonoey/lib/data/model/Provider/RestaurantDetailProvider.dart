import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurantappbywilsonoey/data/api/api_service.dart';
import 'package:restaurantappbywilsonoey/data/model/Restaurant/RestaurantDetail.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;

  final String restoranId;

  RestaurantDetailProvider({required this.apiService, required this.restoranId}) {
    _fetchAllRestaurant();
  }

  late RestaurantDetail _restaurantsResult;
  late ResultState _state;


  RestaurantDetail get result => _restaurantsResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantq = await apiService.getDetailRestaurant(restoranId);
      if (restaurantq.restaurant.id.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _restaurantsResult.restaurant.id = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantsResult = restaurantq;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return 'Error --> $e';
    }
  }
}