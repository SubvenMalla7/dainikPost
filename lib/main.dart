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
        },
      ),
    );
  }
}

// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<List<Photo>> fetchPhotos(http.Client client) async {
//   final response =
//       await client.get('https://jsonplaceholder.typicode.com/photos');
//   print(response.body.length);
//   // Use the compute function to run parsePhotos in a separate isolate.
//   return compute(parsePhotos, response.body);
// }

// // A function that converts a response body into a List<Photo>.
// List<Photo> parsePhotos(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
// }

// class Photo {
//   final int albumId;
//   final int id;
//   final String title;
//   final String url;
//   final String thumbnailUrl;

//   Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

//   factory Photo.fromJson(Map<String, dynamic> json) {
//     return Photo(
//       albumId: json['albumId'] as int,
//       id: json['id'] as int,
//       title: json['title'] as String,
//       url: json['url'] as String,
//       thumbnailUrl: json['thumbnailUrl'] as String,
//     );
//   }
// }

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appTitle = 'Isolate Demo';

//     return MaterialApp(
//       title: appTitle,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;

//   MyHomePage({Key key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: FutureBuilder<List<Photo>>(
//         future: fetchPhotos(http.Client()),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print(snapshot.error);

//           return snapshot.hasData
//               ? PhotosList(photos: snapshot.data)
//               : Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }

// class PhotosList extends StatelessWidget {
//   final List<Photo> photos;

//   PhotosList({Key key, this.photos}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemCount: photos.length,
//       itemBuilder: (context, index) {
//         return Image.network(photos[index].thumbnailUrl);
//       },
//     );
//   }
// }
