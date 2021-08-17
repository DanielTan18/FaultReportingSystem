import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp1_test/helpers/screen_navigation.dart';
import 'package:fyp1_test/helpers/style.dart';
import 'package:fyp1_test/providers/app.dart';
import 'package:fyp1_test/providers/user.dart';
import 'package:fyp1_test/screens/geofence.dart';
import 'package:fyp1_test/screens/login.dart';
import 'package:fyp1_test/screens/report_screen.dart';
import 'package:fyp1_test/screens/view_reports.dart';
import 'package:fyp1_test/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    Map data;
    final databaseReference = Firestore.instance;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff4dd5ff), Colors.lightBlue],
                begin: Alignment.topRight,
              ),
            ),
            accountName: CustomText(
                text: user.userModel?.name ?? "Loading Username...",
                color: white,
                weight: FontWeight.bold,
                size: 18),
            accountEmail: CustomText(
              text: user.userModel?.email ?? "Loading email...",
              color: white,
            ),
          ),
          ListTile(
            onTap: () {
              changeScreen(context, Home());
            },
            leading: Icon(Icons.home),
            title: CustomText(text: "Home"),
          ),
          ListTile(
            onTap: () {
              user.signOut();
              changeScreenReplacement(context, LoginScreen());
            },
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: CustomText(
              text: "Log Out",
              color: Colors.red,
            ),
          ),
        ],
      )),
      body: Stack(fit: StackFit.expand, children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: size.height * .3,
          decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("images/header.png")),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 42),
            Row(
              children: [
                SizedBox(width: 24),
                IconButton(
                    color: white,
                    iconSize: 32,
                    icon: Icon(Icons.menu),
                    onPressed: () => scaffoldKey.currentState.openDrawer()),
                SizedBox(width: 70),
                CustomText(text: "Welcome,", size: 32, color: white),
              ],
            ),
            Container(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_sharp,
                    size: 42,
                    color: white,
                  ),
                  SizedBox(width: 10),
                  CustomText(
                    text: user.userModel?.name,
                    weight: FontWeight.bold,
                    size: 42,
                    color: white,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 24, right: 24, bottom: 0),
              child: Container(
                height: 250,
                child: GestureDetector(
                  onTap: () {
                    changeScreen(context, ReportScreen());
                  },
                  child: Card(
                      color: Color(0xff4dd5ff),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height: 130,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/warning.png"))),
                            ),
                          ),
                          CustomText(
                              text: "Report A Fault",
                              weight: FontWeight.bold,
                              size: 24),
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    crossAxisCount: 2,
                    children: [
                      GestureDetector(
                        onTap: () {
                          changeScreen(context, ViewReportsScreen());
                        },
                        child: Card(
                          color: Color(0xff38ffca),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/viewreports.png")))),
                              ),
                              CustomText(
                                text: "View Fault Reports",
                                size: 17,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          changeScreen(context, GeofenceScreen());
                        },
                        child: Card(
                          color: Color(0xff5B86E5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/location.png")))),
                              ),
                              CustomText(
                                text: "Zone Detection",
                                size: 17,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        )
      ]),
    );
  }
}
