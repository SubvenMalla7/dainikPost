import 'package:flutter/material.dart';

Widget userDetails(
  BuildContext context,
  Size screenSize,
  Color color,
  double radi1,
  double radi2,
  String name,
  String email,
) {
  return Row(
    children: [
      CircleAvatar(
        backgroundColor: color,
        radius: radi1,
        child: CircleAvatar(
          radius: radi2,
          backgroundImage: AssetImage("assets/image/woman.jpg"),
        ),
      ),
      SizedBox(
        width: screenSize.width * 0.04,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
                fontSize: screenSize.height * 0.02,
                color: color,
                fontWeight: FontWeight.w600),
          ),
          Text(
            email,
            style: TextStyle(
                fontSize: screenSize.height * 0.015,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w300),
          ),
        ],
      )
    ],
  );
}
