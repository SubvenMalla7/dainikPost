import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final Color color = Theme.of(context).primaryColor;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          forceElevated: true,
          backgroundColor: Theme.of(context).primaryColor,
          expandedHeight: screenSize.height * 0.25,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20), bottom: Radius.circular(20)),
                    color: color),
                child: Center(
                  child: Text("Users"),
                )),
          ),
        ),
      ],
    );
  }
}
