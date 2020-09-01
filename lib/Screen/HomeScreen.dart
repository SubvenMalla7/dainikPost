import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/dataProvider.dart';
import '../Widgets/bottomNav.dart';
import './PostsScreen.dart';
import './UsersScreen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var _isInt = true;
  // var _isLoading = true;

  // @override
  // void didChangeDependencies() {
  //   if (_isInt) {
  //     Provider.of<DataProvider>(context, listen: false);
  //     print(_isLoading);
  //   }
  //   _isInt = false;
  //   _isLoading = false;

  //   super.didChangeDependencies();
  // }

  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
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
