import 'dart:io';
import 'package:flutter/material.dart';
import 'package:restaurantappbywilsonoey/ui/RestaurantDetailPage.dart';
import 'package:restaurantappbywilsonoey/ui/RestaurantWebView.dart';
import 'package:restaurantappbywilsonoey/ui/home_page.dart';
import 'common/styles.dart';
import 'data/model/Restaurant/ListRestaurant.dart';

class MyHttpOverrides extends HttpOverrides{

  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: Theme
            .of(context)
            .colorScheme
            .copyWith(
          primary: primaryColor,
          onPrimary: Colors.black,
          secondary: secondaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(
            elevation: 0
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.white,
            textStyle: TextStyle(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        RestaurantDetailPage.routeName: (context) =>
            RestaurantDetailPage(restaurantdetail: ModalRoute.of(context)?.settings.arguments as ListRestaurantItem,),
        ArticleWebView.routeName: (context) =>
            ArticleWebView(url: ModalRoute.of(context)?.settings.arguments as String,),
      },
    );
  }
}