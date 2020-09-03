import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:younginnovationinternship/Model/dataProvider.dart';
import '../Widgets/Post/buildPost.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  var _isInt = true;
  var _isLoading = true;
  final ScrollController _controller = ScrollController();

  @override
  void didChangeDependencies() async {
    if (_isInt) {
      await Provider.of<DataProvider>(context, listen: false).postDetailData();
      Provider.of<DataProvider>(context, listen: false).postCommentsData();
    }
    _isInt = false;
    _isLoading = false;

    super.didChangeDependencies();
  }

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
    print("length ${postData.length}");
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: scrollToTop,
          child: Text(
            "Posts",
            style: TextStyle(fontSize: screenSize.height * 0.04, color: color),
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: const EdgeInsets.all(12),
              child: ListView.builder(
                controller: _controller,
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
