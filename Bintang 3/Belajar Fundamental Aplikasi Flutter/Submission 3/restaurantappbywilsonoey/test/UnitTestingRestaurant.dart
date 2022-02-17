// This is a Flutter unit testing test.
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurantappbywilsonoey/data/model/Restaurant/ListRestaurant.dart';

var testing = {
  "id": "rqdv5juczeskfw1e867",
  "name": "Melting Pot",
  "description":
  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
  "pictureId": "14",
  "city": "Medan",
  "rating": 4.2
};

void main() {
  test("Test Parsing", () async {
    var resultid = ListRestaurantItem.fromJson(testing).id;
    var resultname = ListRestaurantItem.fromJson(testing).name;
    var resultdescription = ListRestaurantItem.fromJson(testing).description;
    var resultpictureid = ListRestaurantItem.fromJson(testing).pictureId;
    var resultcity = ListRestaurantItem.fromJson(testing).city;
    var resultrating = ListRestaurantItem.fromJson(testing).rating;
    expect(resultid, "rqdv5juczeskfw1e867");
    expect(resultname, "Melting Pot");
    expect(resultdescription, "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...");
    expect(resultpictureid, "14");
    expect(resultcity, "Medan");
    expect(resultrating, 4.2);
  });
}
