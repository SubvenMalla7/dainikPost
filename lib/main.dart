import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Model/albums.dart';
import './Model/photos.dart';
import './Model/post.dart';
import './Model/users.dart';
import './Screen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UsersInfo()),
        ChangeNotifierProvider.value(value: UserAddress()),
        ChangeNotifierProvider.value(value: UserLocation()),
        ChangeNotifierProvider.value(value: UserCompany()),
        ChangeNotifierProvider.value(value: PostDetails()),
        ChangeNotifierProvider.value(value: PostComments()),
        ChangeNotifierProvider.value(value: Albums()),
        ChangeNotifierProvider.value(value: Photo()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
