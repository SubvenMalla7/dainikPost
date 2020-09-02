import 'package:flutter/material.dart';
import 'package:younginnovationinternship/Screen/UserScreen.dart';
import 'package:younginnovationinternship/Widgets/Post/usersPostWidgets.dart';

class UsersScreen extends StatelessWidget {
  static const routeName = '/users';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Container(
            height: screenSize.height * 0.2,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    "Users",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: screenSize.height * 0.05,
                      fontFamily: 'PTSans',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(UserScreen.routeName),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          userDetails(
                              context,
                              screenSize,
                              Theme.of(context).primaryColor,
                              screenSize.height * 0.035,
                              screenSize.height * 0.030,
                              'name',
                              'email'),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Text(
                              "Posts: 8",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
