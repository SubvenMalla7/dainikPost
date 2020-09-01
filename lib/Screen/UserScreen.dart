import 'package:flutter/material.dart';
import '../Widgets/Post/buildPost.dart';
import '../Widgets/buildFlexibleSpaceBar.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bret",
          style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.height * 0.03,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: false,
            elevation: 0,
            expandedHeight: screenSize.height * 0.35,
            centerTitle: true,
            leading: Container(), // to remove back button
            flexibleSpace: buildFlexibleSpaceBar(
                color, buildWorkAt(context, screenSize), context, screenSize),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Column(
                children: [
                  buildPost(context, screenSize, color),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
