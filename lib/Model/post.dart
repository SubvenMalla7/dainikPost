import 'package:flutter/material.dart';

class PostDetails with ChangeNotifier {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostDetails({this.userId, this.id, this.title, this.body});
}

class PostComments with ChangeNotifier {
  final int postId;
  final int id;
  final String name;
  final String body;
  final String email;

  PostComments({this.postId, this.id, this.name, this.body, this.email});
}
