import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/dataProvider.dart';

import './Screen/LoadingScreen.dart';
import './Screen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFFcc1db9),
          accentColor: Color(0xFFFCAF58),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoadingScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
