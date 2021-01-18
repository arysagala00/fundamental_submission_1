import 'package:flutter/material.dart';
import 'package:fundamental_submission_1/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenLoad extends StatelessWidget {
  static const routeName = '/splash_screen';
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new HomePage(),
      title: new Text(
        'Restaurant App',
        textScaleFactor: 2,
      ),
      image: new Image.network(
          'https://image.freepik.com/free-vector/waiter-preparing-cafe-opening-restaurant-worker-cleaning-table-after-customers-leaving-flat-vector-illustration-catering-service-job_74855-13281.jpg'),
      photoSize: 150.0,
      loaderColor: Colors.blue[500],
    );
  }
}
