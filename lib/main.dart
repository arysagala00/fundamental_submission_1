import 'package:flutter/material.dart';
import 'package:fundamental_submission_1/detail_restaurant.dart';
import 'package:fundamental_submission_1/home_screen.dart';
import 'package:fundamental_submission_1/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Submission 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreenLoad.routeName,
      routes: {
        SplashScreenLoad.routeName: (context) => SplashScreenLoad(),
        HomePage.routeName : (context) => HomePage(),
        RestaurantDetail.routeName: (context) => RestaurantDetail(
              restaurant: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
