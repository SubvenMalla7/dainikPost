import 'package:flutter/material.dart';
import '../Post/commentWidgets.dart';
import '../Post/usersPostWidgets.dart';

Widget buildPost(
    {BuildContext context,
    Size screenSize,
    Color color,
    String name,
    String email,
    String title,
    String body}) {
  return Card(
    elevation: 8,
    child: Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          userDetails(
            context,
            screenSize,
            color,
            screenSize.height * 0.030,
            screenSize.height * 0.025,
            name,
            email,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenSize.height * 0.0225),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              body,
              textAlign: TextAlign.left,
            ),
          ),
          buildCommentsSections(screenSize, color),
        ],
      ),
    ),
  );
}
