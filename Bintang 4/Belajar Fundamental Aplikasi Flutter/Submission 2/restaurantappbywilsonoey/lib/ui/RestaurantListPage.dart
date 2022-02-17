import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantappbywilsonoey/data/model/Provider/RestaurantProvider.dart';
import 'package:restaurantappbywilsonoey/widgets/card_article.dart';
import 'package:restaurantappbywilsonoey/widgets/platform_widget.dart';
import 'RestaurantSearchPage.dart';



class RestaurantListPage extends StatelessWidget {
  Widget buildList(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var article = state.result.restaurants[index];
              return CardArticle(article: article);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text('Eror memuat data'));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text('Gagal memuat data, silahkan periksa koneksi internet Anda'));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {
          showSearch(context: context, delegate: SearchPage());
        })],
      ),
      body: buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(child: _buildAndroid(context));
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

