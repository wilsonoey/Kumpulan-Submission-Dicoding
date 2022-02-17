import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantappbywilsonoey/data/api/api_service.dart';
import 'package:restaurantappbywilsonoey/data/model/Provider/RestaurantSearchProvider.dart';
import 'package:restaurantappbywilsonoey/widgets/CardRestaurantSearchPage.dart';

class SearchPage extends SearchDelegate<RestaurantSearchProvider>{

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {Navigator.pop(context);});
  }

  @override
  Widget buildResults(BuildContext context) {

    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (_) => RestaurantSearchProvider(apiService: ApiService())
        ..fetchAllRestaurant(query),
      child: Consumer<RestaurantSearchProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          } else if (query.length < 3) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "Search term must be longer than two letters.",
                  ),
                )
              ],
            );
          } else if (state.state == ResultState.HasData) {
            //Tampilan 1
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result!.restaurants.length,
              itemBuilder: (context, index) {
                var restaurantItem = state.result!.restaurants[index];
                return CardRestaurantSearchPage(restaurantSearchItems: restaurantItem);

              },
            );

          } else if (state.state != ResultState.HasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "Data not found or does not match",
                  ),
                )
              ],
            );
          } else if (query.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "Data not filled in",
                  ),
                )
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(""),
                )
              ],
            );
          }

        },
      ),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(
      child: Text('Enter keywords in this apps search engine'),
    );
  }

}