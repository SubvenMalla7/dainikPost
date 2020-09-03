import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:younginnovationinternship/Model/dataProvider.dart';

import 'HomeScreen.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = "/";

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var _isInt = true;

  void didChangeDependencies() async {
    if (_isInt) {
      await Provider.of<DataProvider>(context, listen: false).userDataFetch();
      // Provider.of<DataProvider>(context, listen: false).postDetailData();
    }
    _isInt = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
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
