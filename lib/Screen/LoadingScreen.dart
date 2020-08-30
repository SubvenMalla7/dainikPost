import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'HomeScreen.dart';

class LoadingScreen extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset("assets/image/loading.gif"),
      loaderColor: Theme.of(context).primaryColor,
      photoSize: 150.0,
      loadingText: Text(
        "Loading",
        style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold),
      ),
      navigateAfterSeconds: HomeScreen(),
    );
  }
}
