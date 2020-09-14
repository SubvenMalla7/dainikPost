import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screen/AlbumsScreen.dart';
import './Screen/PhotosScreen.dart';
import './Screen/UserScreen.dart';
import './Screen/UsersScreen.dart';
import './Screen/toDoListScreen.dart';
import 'Model/dataProvider.dart';

import './Screen/LoadingScreen.dart';
import './Screen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvider(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFF36476D),
          accentColor: Color(0xFFe07d3a),
          canvasColor: Colors.white,
          fontFamily: 'PTSans',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
            future:
                Provider.of<DataProvider>(context, listen: false).fetchData(),
            builder: (context, snapShot) =>
                snapShot.connectionState == ConnectionState.waiting
                    ? LoadingScreen()
                    : HomeScreen()),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          UserScreen.routeName: (ctx) => UserScreen(),
          UsersScreen.routeName: (ctx) => UsersScreen(),
          ToDoListScreen.routeName: (ctx) => ToDoListScreen(),
          AlbumsScreen.routeName: (ctx) => AlbumsScreen(),
          PhotoScreen.routeName: (ctx) => PhotoScreen(),
        },
      ),
    );
  }
}
