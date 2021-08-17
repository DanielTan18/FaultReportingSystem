import 'package:fyp1_test/models/faultreport.dart';
import 'package:flutter/material.dart';
import 'package:fyp1_test/providers/faultreport.dart';
import 'package:fyp1_test/helpers/style.dart';
import 'package:fyp1_test/helpers/screen_navigation.dart';
import 'package:fyp1_test/providers/app.dart';
import 'package:fyp1_test/providers/user.dart';
import 'package:fyp1_test/screens/gmapscreen.dart';
import 'package:fyp1_test/widgets/custom_text.dart';
import 'package:fyp1_test/widgets/loading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final FaultReportModel faultreport;
  final int index;

  const Details({@required this.faultreport, @required this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  double widgetOpacity = 0.0;
  bool showMessage = false;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      widgetOpacity = 1;

      showMessage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final faultProvider =
        Provider.of<FaultReportProvider>(context, listen: false);
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Container(
                child: Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  changeScreen(context,
                      FullScreen(widget.faultreport.image, widget.index));
                },
                child: Hero(
                  tag: widget.index,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    child: Ink.image(
                      image: NetworkImage(widget.faultreport.image),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            )),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 25.0),
                child: ListView(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: CustomText(
                            text: "Description:",
                            size: 20,
                            weight: FontWeight.bold),
                      ),
                      CustomText(
                        text: widget.faultreport.description,
                        color: Colors.black54,
                      ),
                      widget.faultreport.streetlightno.isNotEmpty
                          ? CustomText(
                              text: "Streetlight No.: " +
                                  widget.faultreport.streetlightno,
                              size: 16,
                              color: Colors.black54)
                          : SizedBox(height: 0),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 4.0),
                        child: CustomText(
                            text: "Status:", size: 20, weight: FontWeight.bold),
                      ),
                      CustomText(
                        text: widget.faultreport.status == "Assigned"
                            ? widget.faultreport.status +
                                " to " +
                                widget.faultreport.department
                            : widget.faultreport.status,
                        size: 20,
                        color: widget.faultreport.status == "Completed"
                            ? green
                            : widget.faultreport.status == "Assigned"
                                ? Colors.orange
                                : red,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 4.0),
                        child: CustomText(
                            text: "Urgency:",
                            size: 20,
                            weight: FontWeight.bold),
                      ),
                      CustomText(
                          text: widget.faultreport.urgency,
                          size: 20,
                          color: widget.faultreport.urgency == "Low"
                              ? green
                              : widget.faultreport.urgency == "Medium"
                                  ? Colors.orange
                                  : widget.faultreport.urgency == "High"
                                      ? red
                                      : black),
                      SizedBox(height: 80),
                    ],
                  ),
                ]),
              ),
            ),
          ))
        ])),
        Container(
          margin: EdgeInsets.only(top: 25),
          child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: white,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              )),
        ),
        AnimatedOpacity(
          opacity: widgetOpacity,
          duration: Duration(milliseconds: 500),
          child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 120,
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 30,
                          offset: Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 16.0,
                    left: 20.0,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: DateFormat('MMMM dd yyyy, hh:mm aaa')
                                  .format(DateTime.fromMillisecondsSinceEpoch(
                                          widget.faultreport.createdAt)
                                      .add(Duration(hours: 8))) //add to gmt+8
                                  .toString(),
                              size: 21,
                              weight: FontWeight.bold),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CustomText(
                                color: red,
                                size: 25,
                                text: widget.faultreport.urgency == "Low"
                                    ? "!"
                                    : widget.faultreport.urgency == "Medium"
                                        ? "!!"
                                        : widget.faultreport.urgency == "High"
                                            ? "!!!"
                                            : ""),
                          ),
                        ],
                      ),
                      CustomText(text: widget.faultreport.faulttype),
                      CustomText(
                          text: widget.faultreport.location,
                          color: Colors.black38,
                          weight: FontWeight.bold,
                          size: 14),
                    ],
                  ),
                ),
              )),
        ),
        AnimatedPositioned(
          curve: Curves.easeOut,
          width: 410,
          duration: Duration(milliseconds: 500),
          bottom: showMessage ? 0 : -50,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        changeScreen(
                            context,
                            GmapScreen(
                                lat: widget.faultreport.lat,
                                lng: widget.faultreport.lng));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ],
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text("Go To Location",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      ),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}

class FullScreen extends StatelessWidget {
  FullScreen(this.imageurl, this.index);
  final String imageurl;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: index,
            child: Card(
              margin: EdgeInsets.all(0),
              child: Ink.image(
                height: MediaQuery.of(context).size.height,
                image: NetworkImage(imageurl),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
