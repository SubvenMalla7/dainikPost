import 'package:flutter/material.dart';
import '../Post/commentWidgets.dart';
import '../Post/usersPostWidgets.dart';

Widget buildPost(BuildContext context, Size screenSize, Color color) {
  return Card(
    elevation: 8,
    child: Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          userDetails(context, screenSize, color, screenSize.height * 0.030,
              screenSize.height * 0.025, "Bret", "Bret@bret.com"),
          Text(
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenSize.height * 0.0225),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
              textAlign: TextAlign.left,
            ),
          ),
          buildCommentsSections(screenSize, color),
        ],
      ),
    ),
  );
}
