import 'package:flutter/material.dart';
import '../Widgets/Post/buildPost.dart';

class UserPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext c, i) => Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Center(
            child: Text('post'),
          ),
        ),
      ),
    );
  }
}
