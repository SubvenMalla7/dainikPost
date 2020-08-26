import 'package:flutter/material.dart';

class Albums with ChangeNotifier {
  final int userId;
  final int id;
  final String title;

  Albums({
    this.userId,
    this.id,
    this.title,
  });
}
