import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:younginnovationinternship/Model/dataProvider.dart';
import '../Widgets/Post/buildPost.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final screenSize = MediaQuery.of(context).size;
    final userData = Provider.of<DataProvider>(context).userInfo;
    final postData = Provider.of<DataProvider>(context).postDetails;
    print("length ${postData.length}");
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "Posts",
          style: TextStyle(fontSize: screenSize.height * 0.04, color: color),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: postData.length,
          itemBuilder: (BuildContext c, i) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: buildPost(
              context: context,
              screenSize: screenSize,
              color: color,
              name: userData[postData[i].userId - 1].name,
              email: userData[postData[i].userId - 1].email,
              title: postData[i].title,
              body: postData[i].body,
            ),
          ),
        ),
      ),
    );
  }
}
