import 'dart:async';
import 'dart:collection';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fyp1_test/helpers/screen_navigation.dart';
import 'package:fyp1_test/helpers/style.dart';
import 'package:fyp1_test/models/faultreport.dart';
import 'package:fyp1_test/providers/user.dart';
import 'package:fyp1_test/screens/report_screen.dart';
import 'package:fyp1_test/screens/view_reports.dart';
import 'package:fyp1_test/widgets/custom_text.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(GeofenceScreen());

class GeofenceScreen extends StatefulWidget {
  final FaultReportModel faultreport;

  const GeofenceScreen({Key key, this.faultreport}) : super(key: key);
  @override
  _GeofenceScreenState createState() => _GeofenceScreenState();
}

class _GeofenceScreenState extends State<GeofenceScreen> {
  final geofenceService = GeofenceService();
  final districtService = GeofenceService();

  final activityController = StreamController<Activity>();
  final geofenceController = StreamController<Geofence>();
  final districtController = StreamController<Geofence>();

  Set<Marker> _markers = HashSet<Marker>();
  Set<Circle> _circles = HashSet<Circle>();
  GoogleMapController _mapController;
  List<Geofence> geofenceList = [];
  List<Geofence> districtList = [
    Geofence(
        id: "Kampar District",
        latitude: 4.3085,
        longitude: 101.1537,
        radius: [GeofenceRadius(id: 'radius_3000m', length: 3000)])
  ];
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = Provider.of<UserProvider>(context);
    user.getReports();

    for (int i = 0; i < user.faultreports.length; i++) {
      if (user.faultreports[i].status != "Completed" &&
          user.faultreports[i].status != "Rejected") {
        geofenceList.add(
          Geofence(
              id: user.faultreports[i].id,
              latitude: user.faultreports[i].lat,
              longitude: user.faultreports[i].lng,
              radius: [GeofenceRadius(id: 'radius_100m', length: 100)]),
        );
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    final user = Provider.of<UserProvider>(context, listen: false);
    user.getReports();
    _setCircles();
    _mapController = controller;

    setState(() {
      for (int i = 0; i < user.faultreports.length; i++) {
        if (user.faultreports[i].status != "Completed" &&
            user.faultreports[i].status != "Rejected") {
          _markers.add(Marker(
              markerId: MarkerId("$i"),
              position:
                  LatLng(user.faultreports[i].lat, user.faultreports[i].lng),
              infoWindow: InfoWindow(
                  title: user.faultreports[i].faulttype,
                  snippet: user.faultreports[i].location)));
        }
      }
    });
  }

  void _setCircles() {
    final user = Provider.of<UserProvider>(context, listen: false);
    user.getReports();

    _circles.add(Circle(
        circleId: CircleId("Kampar"),
        center: LatLng(4.3085, 101.1537),
        radius: 3000,
        strokeWidth: 1,
        strokeColor: Color.fromARGB(25, 0, 0, 0),
        fillColor: Color.fromARGB(40, 145, 160, 255)));
    for (int i = 0; i < user.faultreports.length; i++) {
      if (user.faultreports[i].status != "Completed" &&
          user.faultreports[i].status != "Rejected") {
        _circles.add(Circle(
            circleId: CircleId("$i"),
            center: LatLng(user.faultreports[i].lat, user.faultreports[i].lng),
            radius: 100,
            strokeWidth: 1,
            strokeColor: Color.fromARGB(140, 0, 0, 0),
            fillColor: Color.fromARGB(30, 87, 252, 255)));
      }
    }
  }

  void onGeofenceStatusChanged(Geofence geofence, GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus) {
    switch (geofenceStatus.toString()) {
      case "GeofenceStatus.EXIT":
        {
          dev.log(
              "Exiting Area " + geofence.id + ", radius " + geofenceRadius.id);
          scheduleNotification(
              "Exit of a fault area!", "Click here to view reports.");
        }
        break;
      case "GeofenceStatus.ENTER":
        {
          dev.log(
              "Entering Area " + geofence.id + ", radius " + geofenceRadius.id);
          scheduleNotification(
              "Entry of a fault area!", "Click here to view reports.");
        }
        break;
    }
    geofenceController.sink.add(geofence);
  }

  void onDistrictStatusChanged(Geofence geofence, GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus) {
    switch (geofenceStatus.toString()) {
      case "GeofenceStatus.EXIT":
        {
          dev.log("Exiting District " +
              geofence.id +
              ", radius " +
              geofenceRadius.id);
          scheduleNotification(
              "You have exited ${geofence.id}", "Click here to view reports.");
        }
        break;
      case "GeofenceStatus.ENTER":
        {
          dev.log("Entering District " +
              geofence.id +
              ", radius " +
              geofenceRadius.id);
          scheduleNotification("You have entered ${geofence.id}!",
              "Click here to view reports.");
        }
        break;
    }
    // dev.log('geofence: ${geofence.toMap()}');
    // dev.log('geofenceRadius: ${geofenceRadius.toMap()}');
    // dev.log('geofenceStatus: ${geofenceStatus.toString()}\n');
    districtController.sink.add(geofence);
  }

  void onActivityChanged(Activity prevActivity, Activity currActivity) {
    dev.log('prevActivity: ${prevActivity.toMap()}');
    dev.log('currActivity: ${currActivity.toMap()}\n');
    activityController.sink.add(currActivity);
  }

  void onError(dynamic error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      dev.log('Undefined error: $error');
      print("some eerrorr: $error");
      return;
    }

    dev.log('ErrorCode: $errorCode');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      geofenceService.setOnGeofenceStatusChanged(onGeofenceStatusChanged);
      geofenceService.setOnActivityChanged(onActivityChanged);
      geofenceService.setOnStreamError(onError);
      geofenceService.start(geofenceList).catchError(onError);

      districtService.setOnGeofenceStatusChanged(onDistrictStatusChanged);
      districtService.setOnStreamError(onError);
      districtService.start(districtList).catchError(onError);
    });
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS =
        IOSInitializationSettings(onDidReceiveLocalNotification: null);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Use to run the geofence service in the background.
      // Declare between the [MaterialApp] and [Scaffold] widgets.
      home: WithForegroundService(
        geofenceService: geofenceService,
        child: Scaffold(
            appBar: AppBar(
                title:
                    CustomText(text: 'Zone Detection', size: 20, color: white),
                leading: IconButton(
                    icon: Icon(Icons.close, color: white),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                centerTitle: true),
            body: buildContentView()),
      ),
    );
  }

  @override
  void dispose() {
    activityController.close();
    geofenceController.close();
    districtController.close();
    super.dispose();
  }

  Widget buildContentView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 280,
          child: GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            markers: _markers,
            circles: _circles,
            initialCameraPosition: CameraPosition(
              target: LatLng(4.32852, 101.13581),
              zoom: 12,
            ),
          ),
        ),
        Expanded(child: buildDistrictMonitor())
      ],
    );
  }

  // Widget buildActivityMonitor() {
  //   return StreamBuilder<Activity>(
  //       stream: activityController.stream,
  //       builder: (context, snapshot) {
  //         final updatedTime = DateTime.now();
  //         final content = snapshot.data?.toMap()?.toString() ?? '';

  //         return Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('\tActivity (updated: $updatedTime)'),
  //               Card(color: Colors.lightGreen, child: Text(content))
  //             ]);
  //       });
  // }

  Widget buildGeofenceMonitor() {
    return StreamBuilder<Geofence>(
        stream: geofenceController.stream,
        builder: (context, snapshot) {
          final updatedTime = DateTime.now();
          final content = snapshot.data?.toMap()?.toString() ?? '';

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\tGeofence (updated: $updatedTime)'),
                Container(
                  child: Card(
                      color: Colors.lightGreen,
                      child: content.isNotEmpty
                          ? Text(content.substring(0, 196))
                          : Text("Not near a fault yet")),
                )
              ]);
        });
  }

  Widget buildDistrictMonitor() {
    return StreamBuilder<Geofence>(
        stream: districtController.stream,
        builder: (context, snapshot) {
          final content = snapshot.data?.toMap()?.toString() ?? '';
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card(
                //     color: Colors.lightBlue,
                //     child: content.isNotEmpty
                //         ? Text(content.substring(0, 196))
                //         : Text("Not in a recorded district yet.")),
                content.contains("Kampar District") &&
                        content.contains("GeofenceStatus.ENTER")
                    ? DetectedAuthorities(content: content)
                    : Expanded(
                        child: Center(
                            child: CustomText(
                                text: "Not in a Recorded District.",
                                color: Colors.black26)),
                      )
              ]);
        });
  }

  Future selectNotification(String payload) async {
    changeScreen(context, ViewReportsScreen());
  }

  void scheduleNotification(String title, String subtitle) {
    print("Scheduling a notification with $title and $subtitle");
    var rng = new Random();
    Future.delayed(Duration(seconds: 2)).then((result) async {
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          importance: Importance.low,
          priority: Priority.low,
          playSound: false,
          ticker: 'ticker');

      var iOSPlatformChannelSpecifics = IOSNotificationDetails();

      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics);

      await flutterLocalNotificationsPlugin.show(
          rng.nextInt(100000), title, subtitle, platformChannelSpecifics,
          payload: 'item x');
    });
  }
}

class DetectedAuthorities extends StatelessWidget {
  const DetectedAuthorities({
    Key key,
    @required this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: content.contains("Kampar District") &&
              content.contains("GeofenceStatus.ENTER")
          ? 1.0
          : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Ink.image(
                    height: 160,
                    image: AssetImage(
                      'images/mdkampar.jpg',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kampar District Council',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                                "Kompleks Pentadbiran MD Kampar,\nJalan Iskandar, 31900 Kampar, Perak.",
                                style: TextStyle(color: Colors.black45)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.blue,
                                    ),
                                    TextButton(
                                      child: Text("+05-4671020"),
                                      onPressed: () =>
                                          launch("tel://05-4671020"),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      changeScreenReplacement(
                                          context, ReportScreen());
                                    },
                                    child: const Text('Report A Fault'),
                                  ),
                                ),
                              ],
                            ),
                          ])),
                ],
              ),
            )),
      )),
    );
  }
}
