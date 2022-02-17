import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restaurantappbywilsonoey/ui/RestaurantDetailPage.dart';
import 'package:restaurantappbywilsonoey/ui/RestaurantWebView.dart';
import 'package:restaurantappbywilsonoey/ui/home_page.dart';
import 'package:restaurantappbywilsonoey/utils/BackgroundService.dart';
import 'package:restaurantappbywilsonoey/utils/NotificationHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/navigation.dart';
import 'common/styles.dart';
import 'data/api/api_service.dart';
import 'data/db/DatabaseHelper.dart';
import 'data/model/Provider/DatabaseProvider.dart';
import 'data/model/Provider/RestaurantProvider.dart';
import 'data/model/Provider/SchedulingProvider.dart';
import 'data/model/Restaurant/ListRestaurant.dart';
import 'data/preferences/preferences_helper.dart';
import 'data/preferences/preferences_provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class MyHttpOverrides extends HttpOverrides{
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Restaurant App',
            theme: provider.themeData,
            builder: (context, child) {
              return CupertinoTheme(
                data: CupertinoThemeData(
                  brightness:
                  provider.isDarkTheme ? Brightness.dark : Brightness.light,
                ),
                child: Material(
                  child: child,
                ),
              );
            },
            navigatorKey: navigatorKey,
            initialRoute: HomePage.routeName,
            routes: {
              HomePage.routeName: (context) => HomePage(),
              RestaurantDetailPage.routeName: (context) =>
                  RestaurantDetailPage(restaurantdetail: ModalRoute.of(context)?.settings.arguments as ListRestaurantItem,),
              ArticleWebView.routeName: (context) =>
                  ArticleWebView(url: ModalRoute.of(context)?.settings.arguments as String,),
            },
          );
        },
      ),
    );

  }
}