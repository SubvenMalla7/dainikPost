import 'package:flutter/material.dart';
import 'package:younginnovationinternship/Screen/AlbumsScreen.dart';
import 'package:younginnovationinternship/Screen/userPostScreen.dart';

class UserPosts extends StatelessWidget {
  _textStyle(BuildContext context) {
    return TextStyle(
        fontSize: 20,
        color: Theme.of(context).accentColor,
        fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: screenSize.height * 0.075,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Post',
              ),
              Tab(text: 'Albums'),
            ],
          ),
        ),
        // body: TabBarView(
        //   children: [UserPostScreen(), AlbumsScreen()],
        // ),
      ),
    );
  }
}
