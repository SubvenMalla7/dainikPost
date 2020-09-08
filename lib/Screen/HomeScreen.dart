import 'package:flutter/material.dart';

import '../Widgets/bottomNav.dart';
import './PostsScreen.dart';
import './UsersScreen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();

    _pages = [
      {
        'page': PostsScreen(),
        'title': 'Dashboard',
      },
      {
        'page': UsersScreen(),
        'title': 'Add Medicines',
      },
    ];
  }

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedPageIndex]['page'],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("ToDo list pressed");
          },
          child: Icon(
            Icons.assignment,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        bottomNavigationBar: bottomNav(context, selectPage, _selectedPageIndex),
      ),
    );
  }
}
