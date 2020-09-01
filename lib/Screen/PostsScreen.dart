import 'package:flutter/material.dart';
import '../Widgets/Post/buildPost.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext c, i) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: buildPost(context, screenSize, color),
          ),
        ),
      ),
    );
  }
}
