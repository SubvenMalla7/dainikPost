import 'package:flutter/material.dart';
import '../Post/usersPostWidgets.dart';

Widget buildCommentsSections(Size screenSize, Color color) {
  return ExpansionTile(
    title: Text("Comments"),
    children: [
      Container(
        height: screenSize.height * 0.5,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, i) => buildComments(
              context,
              screenSize,
              color,
              'id labore ex et quam laborum',
              "Eliseo@gardner.biz",
              "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"),
        ),
      ),
    ],
  );
}

Widget buildComments(BuildContext context, Size screenSize, Color color,
    String name, String email, String comments) {
  return Container(
    child: Column(
      children: [
        userDetails(context, screenSize, color, screenSize.height * 0.025,
            screenSize.height * 0.020, name, email),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              comments,
            ),
          ),
        )
      ],
    ),
  );
}
