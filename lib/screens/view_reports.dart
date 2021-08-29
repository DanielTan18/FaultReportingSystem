import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fyp1_test/helpers/screen_navigation.dart';
import 'package:fyp1_test/helpers/style.dart';
import 'package:fyp1_test/models/faultreport.dart';
import 'package:fyp1_test/providers/user.dart';
import 'package:fyp1_test/screens/details.dart';
import 'package:fyp1_test/widgets/custom_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewReportsScreen extends StatelessWidget {
  final FaultReportModel faultreport;

  const ViewReportsScreen({Key key, this.faultreport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    user.getReports();
    user.faultreports.sort((a, b) => b.createdAt - a.createdAt);
    for (var s in user.faultreports) {
      if (s.status == "Completed" || s.status == "Rejected") {
        user.faultreports.insert(user.faultreports.length, s);
        user.faultreports.remove(s);
      }
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: black),
          backgroundColor: white,
          elevation: 10,
          title: CustomText(text: "View Reports", size: 20),
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
              itemCount: user.faultreports.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                FaultReportModel _faultreport = user.faultreports[index];
                return GestureDetector(
                  onTap: () {
                    changeScreen(
                        context,
                        Details(
                            faultreport: user.faultreports[index],
                            index: index));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Card(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: user.faultreports[index].status ==
                                            "Completed" ||
                                        user.faultreports[index].status ==
                                            "Rejected"
                                    ? Colors.grey.withOpacity(0.5)
                                    : Colors.grey.withOpacity(0),
                                backgroundBlendMode: BlendMode.saturation,
                              ),
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                          // REPORT IMAGE
                                          child: Container(
                                        width: 130.0,
                                        height: 130.0,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                            ),
                                            child: Hero(
                                              tag: index,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.fill,
                                                imageUrl: _faultreport.image,
                                                placeholder: (context, url) =>
                                                    new CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            )),
                                      )
                                          // child: Image.asset(
                                          //     'images/pothole.jpg')),
                                          ),
                                      SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            //REPORT FAULT CREATED AT
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text(
                                                DateFormat(
                                                        'd MMMM yyyy, hh:mm aaa')
                                                    .format(DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                _faultreport
                                                                    .createdAt)
                                                        .add(Duration(
                                                            hours:
                                                                8))) //add to gmt+8
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Expanded(
                                            // REPORT FAULT LOCATION
                                            child: new Container(
                                              constraints:
                                                  BoxConstraints(maxWidth: 225),
                                              padding: new EdgeInsets.only(
                                                  right: 0.0),
                                              child: new Text(
                                                _faultreport.location,
                                                overflow: TextOverflow.ellipsis,
                                                style: new TextStyle(
                                                  fontSize: 13.0,
                                                  fontFamily: 'Roboto',
                                                  color: new Color(0xFF212121),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            //REPORT FAULT TYPE
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(
                                              _faultreport.faulttype,
                                              style: TextStyle(
                                                  color: Colors.black38),
                                            ),
                                          ),
                                          Padding(
                                            //REPORT STATUS
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(
                                              _faultreport.status,
                                              style: TextStyle(
                                                  color: _faultreport.status ==
                                                          "Completed"
                                                      ? Colors.green
                                                      : Colors.red),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10)),
                                ],
                              )))),
                );
              }),
        ));
  }
}
