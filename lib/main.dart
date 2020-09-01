import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:younginnovationinternship/Screen/UserScreen.dart';
import 'package:younginnovationinternship/Screen/UsersScreen.dart';
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
      child: Consumer<DataProvider>(
        builder: (ctx, data, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Color(0xFFcc1db9),
            accentColor: Color(0xFFFCAF58),
            canvasColor: Colors.white70,
            fontFamily: 'PTSans',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(
            future: data.userDataFetch(),
            builder: (ctx, authResultSnapShot) =>
                authResultSnapShot.connectionState == ConnectionState.waiting
                    ? LoadingScreen()
                    : HomeScreen(),
          ),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            UserScreen.routeName: (ctx) => UserScreen(),
            UsersScreen.routeName: (ctx) => UsersScreen(),
          },
        ),
      ),
    );
  }
}
