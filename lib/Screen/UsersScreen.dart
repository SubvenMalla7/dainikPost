import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:younginnovationinternship/Model/dataProvider.dart';
import 'package:younginnovationinternship/Screen/UserScreen.dart';
import 'package:younginnovationinternship/Widgets/Post/usersPostWidgets.dart';
import 'package:younginnovationinternship/Widgets/buildFlexibleSpaceBar.dart';
import 'package:younginnovationinternship/Widgets/mainUiWidget.dart';

class UsersScreen extends StatelessWidget {
  static const routeName = '/users';
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<DataProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    return buildMainUi(
        context: context,
        body: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) => UserCards(
              screenSize: screenSize,
              name: userData.userInfo[i].name,
              email: userData.userInfo[i].email,
              id: userData.userInfo[i].id,
              userInfo: userData.userInfo[i],
              userAddress: userData.userAddress[i],
              userCompany: userData.userCompany[i],
              userlocations: userData.userLocation[i],
            ),
            childCount: userData.userInfo.length,
          ),
        ),
        heading: "Users");
  }
}

class UserCards extends StatelessWidget {
  const UserCards({
    Key key,
    @required this.screenSize,
    this.name,
    this.email,
    this.id,
    this.userInfo,
    this.userAddress,
    this.userlocations,
    this.userCompany,
  }) : super(key: key);

  final Size screenSize;
  final String name;
  final String email;
  final int id;
  final userInfo;
  final userAddress;
  final userlocations;
  final userCompany;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        UserScreen.routeName,
        arguments: UserScreen(
          userInfo: userInfo,
          userAddress: userAddress,
          userCompany: userCompany,
          userlocations: userlocations,
          id: id,
        ),
      ),
      child: Card(
        shape: StadiumBorder(),
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
                  screenSize.height * 0.053,
                  screenSize.height * 0.050,
                  name,
                  email,
                  id),
              Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.arrow_forward_ios_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
