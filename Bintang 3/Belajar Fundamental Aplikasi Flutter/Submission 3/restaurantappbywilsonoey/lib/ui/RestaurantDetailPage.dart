import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantappbywilsonoey/data/api/api_service.dart';
import 'package:restaurantappbywilsonoey/data/model/Provider/RestaurantDetailProvider.dart';
import 'package:restaurantappbywilsonoey/data/model/Restaurant/ListRestaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final ListRestaurantItem restaurantdetail;
  const RestaurantDetailPage({required this.restaurantdetail});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
        create: (_) => RestaurantDetailProvider(restoranId: restaurantdetail.id, apiService: ApiService()),
        child: Consumer<RestaurantDetailProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.Loading) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blueAccent,
                ),
              );
            } else if (state.state == ResultState.HasData) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Restaurant App'),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Hero(
                          tag: state.result.restaurant.name,
                          child: Text(
                            state.result.restaurant.name,
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(ApiService.baseUrlImage + state.result.restaurant.pictureId),
                            Text(
                              state.result.restaurant.description,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Divider(color: Colors.grey),
                            Text(
                              'City : ${state.result.restaurant.city}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              'Address : ${state.result.restaurant.address}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              'Rating : ${state.result.restaurant.rating}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Divider(color: Colors.grey),
                          ],
                        ),
                      ),

                      ListTile(
                        leading: Icon(Icons.category),
                        title: Text('Categories'),
                      ),
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.result.restaurant.categories.length,
                          itemBuilder: (context, index) => ListTile(
                            subtitle: Text(state.result.restaurant.categories[index].name),
                          ),
                        ),
                      ),


                      ListTile(
                        leading: Icon(Icons.food_bank),
                        title: Text('Food'),
                      ),
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.result.restaurant.menus.foods.length,
                          itemBuilder: (context, index) => ListTile(
                            subtitle: Text(state.result.restaurant.menus.foods[index].name),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.local_drink),
                        title: Text('Drink'),
                      ),
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.result.restaurant.menus.drinks.length,
                          itemBuilder: (context, index) => ListTile(
                            subtitle: Text(state.result.restaurant.menus.drinks[index].name),
                          ),
                        ),
                      ),

                      ListTile(
                        leading: Icon(Icons.rate_review),
                        title: Text('Customer Reviews'),
                      ),
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.result.restaurant.customerReviews.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(state.result.restaurant.customerReviews[index].name),
                            subtitle: Text(state.result.restaurant.customerReviews[index].date),
                            trailing: SizedBox(
                                height: 100, width: 100,
                                child: Text(state.result.restaurant.customerReviews[index].review)
                            ),
                              //
                          ),
                        ),
                      ),

                      ListTile(
                        leading: Icon(Icons.rate_review_outlined),
                        title: Text('Comment This Restaurant'),
                      ),
                      TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(labelText: 'Your Name'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(labelText: 'Comment'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ButtonTheme(
                          buttonColor: Colors.blue,
                          minWidth: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              if (state.hasListeners) {
                                ('nama');
                                if (state.hasListeners) {
                                  // _controller.clear();
                                  // _controller1.clear();
                                  // setState(() {
                                  //   _detailRestaurant = ApiService()
                                  //       .getDetailRestaurant(widget.restaurant.id);
                                  // });
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Data Berhasil disimpan"),
                                    ),
                                  );
                                } else {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Data gagal disimpan"),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text("Submit"),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            } else if (state.state == ResultState.NoData) {
              return Scaffold(
                  body: Center(
                      child: Text('Eror memuat data')
                  )
              );

            } else if (state.state == ResultState.Error) {
              return Scaffold(
                  body: Center(
                      child: Text('Gagal memuat data, silahkan periksa koneksi internet Anda')
                  )
              );
            } else {
              return Scaffold(body: Center(child: Text('')));
            }
          },
        ),
    );
  }

}



