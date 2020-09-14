import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:younginnovationinternship/Model/dataProvider.dart';
import 'package:younginnovationinternship/Widgets/mainUiWidget.dart';
import '../Widgets/Post/buildPost.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final ScrollController _controller = ScrollController();

  void scrollToTop() {
    _controller.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final screenSize = MediaQuery.of(context).size;
    final userData = Provider.of<DataProvider>(context).userInfo;
    final postData = Provider.of<DataProvider>(context).postDetails;

    return buildMainUi(
      context: context,
      body: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            child: buildPost(
                context: context,
                screenSize: screenSize,
                color: color,
                name: userData[postData[i].userId - 1].name,
                email: userData[postData[i].userId - 1].email,
                title: postData[i].title,
                body: postData[i].body,
                postID: postData[i].id,
                id: userData[postData[i].userId - 1].id),
          ),
          childCount: postData.length,
        ),
      ),
      heading: "Posts",
      padding: const EdgeInsets.only(left: 18.0, top: 40, bottom: 20),
    );
  }
}
