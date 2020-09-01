import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

Widget buildIconButton(
    BuildContext context, String text, IconData icon, Function launchWebsite) {
  return Column(
    children: [
      CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.03,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: MediaQuery.of(context).size.height * 0.03,
            ),
            onPressed: launchWebsite,
          )),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.015),
      )
    ],
  );
}

Widget buildWorkAt(BuildContext context, Size screenSize) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.business_center,
              color: Colors.white, size: screenSize.height * 0.03),
          SizedBox(
            width: screenSize.height * 0.015,
          ),
          Text(
            "Works at:",
            style: TextStyle(
                color: Colors.white, fontSize: screenSize.height * 0.03),
          ),
        ],
      ),
      Text(
        "Romaguera-Crona",
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      Text(
        '"Multi-layered client-server neural-net"',
        style:
            TextStyle(color: Colors.white, fontSize: screenSize.height * 0.015),
      ),
      Text(
        '"harness real-time e-markets"',
        style:
            TextStyle(color: Colors.white, fontSize: screenSize.height * 0.015),
      ),
    ],
  );
}

FlexibleSpaceBar buildFlexibleSpaceBar(
    Color color, Column workAt, BuildContext context, Size screenSize) {
  _launchURL() async {
    print("object");
    const url = 'https://www.google.com/maps/search/1,1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("object");
      throw 'Could not launch $url';
    }
  }

  _launchWebsite() async {
    print("object");
    const url = 'https://www.hildegard.org';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("object");
      throw 'Could not launch $url';
    }
  }

  _makePhoneCall() async {
    var url = 'tel:103';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _makeMail() async {
    var url = 'mailto:smith@example.org';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  return FlexibleSpaceBar(
    background: Container(
        decoration: BoxDecoration(color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: screenSize.height * 0.06,
                        backgroundImage: AssetImage('assets/image/man.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Leanne Graham",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize.height * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Theme.of(context).accentColor,
                              size: screenSize.height * 0.02,
                            ),
                            InkWell(
                              onTap: _launchURL,
                              child: Text(
                                "Gwenborough",
                                style: TextStyle(
                                  fontSize: screenSize.height * 0.02,
                                  color: Theme.of(context).accentColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                buildWorkAt(context, screenSize),
              ],
            ),
            // SizedBox(
            //   height: screenSize.height * 0.005,
            // ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIconButton(context, "Email", Icons.email, _makeMail),
                  buildIconButton(
                      context, "Phone", Icons.phone, _makePhoneCall),
                  buildIconButton(
                      context, "Website", Icons.web, _launchWebsite),
                ],
              ),
            )
          ],
        )),
  );
}
