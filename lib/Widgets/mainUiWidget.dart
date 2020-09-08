import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildMainUi({BuildContext context, String heading, Widget body}) {
  final screenSize = MediaQuery.of(context).size;
  return Container(
    color: Theme.of(context).primaryColor,
    child: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        forceElevated: false,
        elevation: 0,
        expandedHeight: screenSize.height * 0.20,
        centerTitle: true,
        leading: Container(), // to remove back button
        flexibleSpace: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 18.0, top: 40, bottom: 20),
          child: Text(
            heading,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: screenSize.height * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      Container(child: body)
    ]),
  );
}
