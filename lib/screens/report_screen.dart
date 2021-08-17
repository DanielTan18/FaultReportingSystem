import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fyp1_test/helpers/faultreport.dart';
import 'package:fyp1_test/helpers/screen_navigation.dart';
import 'package:fyp1_test/helpers/style.dart';
import 'package:fyp1_test/providers/user.dart';
import 'package:fyp1_test/screens/label_screen.dart';
import 'package:fyp1_test/screens/scan_screen.dart';
import 'package:fyp1_test/screens/streetlightgmap.dart';
import 'package:fyp1_test/widgets/custom_text.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_place/google_place.dart' as gplace;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../providers/location.dart' as l;
import 'picker_page.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String valueChoose;
  String formattedAddress = "";
  String fileName = "";
  String url = "";
  double _lat = 0, _lng = 0;
  List listItem = [
    "Pothole",
    "Faulty Traffic Light",
    "Broken Road Sign",
    "Faulty Streetlight"
  ];
  TextEditingController _descController = TextEditingController();
  TextEditingController _streetlightController = TextEditingController();
  TextEditingController _locationInputController = TextEditingController();
  File _imageFile;
  var googlePlace = gplace.GooglePlace("<YOUR API KEY>");
  final ImagePicker _picker = ImagePicker();
  FaultReportServices _faultReportServices = FaultReportServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(text: "Report a Fault", size: 24, color: white),
        ),
        body: Center(
          child: ListView(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: _imageFile == null
                          ? AssetImage("images/image_placeholder.png")
                          : FileImage(File(_imageFile.path)),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 25,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet()),
                          );
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.teal,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: TextField(
                controller: _locationInputController,
                decoration: InputDecoration(
                    hintText: "Location",
                    labelText: "Location",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: IconButton(
                        color: Colors.blueAccent,
                        padding: const EdgeInsets.fromLTRB(0, 0, 23, 0),
                        onPressed: () async {
                          l.Location location = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapPickerPage()),
                          );
                          if (location != null) {
                            setState(() {
                              _lat = location.lat;
                              _lng = location.lng;
                            });
                          }
                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(_lat, _lng);
                          var first = placemarks.first;
                          formattedAddress =
                              '${first.name},  ${first.thoroughfare}, ${first.subLocality},${first.locality}, ${first.administrativeArea}';
                          _locationInputController.text = formattedAddress;
                        },
                        icon: Icon(
                          Icons.location_on_outlined,
                          size: 28,
                          color: Colors.black54,
                        ))),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text("Type of Fault:"),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                    value: valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            valueChoose == "Faulty Streetlight"
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: _streetlightController,
                            decoration: InputDecoration(
                                hintText: "Streetlight Number",
                                labelText: "Streetlight Number",
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 110,
                            child: TextButton(
                                onPressed: () {
                                  changeScreen(
                                      context, StreetlightGmapScreen());
                                },
                                child: Text(
                                  "View Streetlights",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                )),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              changeScreen(context, ScanScreen());
                            },
                            child: Text("Scan Text",
                                style: TextStyle(fontSize: 15))),
                        SizedBox(width: 10),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _descController,
                decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: IconButton(
                      padding: const EdgeInsets.fromLTRB(0, 0, 23, 0),
                      onPressed: () {
                        changeScreen(context, LabelScreen());
                      },
                      icon: Icon(Icons.image_search,
                          size: 28, color: Colors.black54),
                    )),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8)),
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                      )),
                  child: CustomText(
                      text: "Submit",
                      color: white,
                      weight: FontWeight.bold,
                      size: 20),
                  onPressed: () async {
                    print("Location input is " + _locationInputController.text);
                    print("Type of fault is " + valueChoose);
                    print("DESCRIPTION IS " + _descController.text);
                    print("current user uid is " + user.user.uid);
                    print("streetlightno is " + _streetlightController.text);
                    await uploadPic(context);
                    print("url issss " + url);
                    //mapping the report info to upload to firestore
                    var uuid = Uuid();
                    String id = uuid.v4();
                    _faultReportServices.createFaultReport(
                        id: id,
                        description: _descController.text,
                        faulttype: valueChoose,
                        image: url,
                        location: _locationInputController.text,
                        lat: _lat,
                        lng: _lng,
                        userId: user.user.uid,
                        status: "Open",
                        department: "Unassigned",
                        urgency: "Low",
                        streetlightno: _streetlightController.text);
                    Navigator.pop(context);
                    Flushbar(
                      title: "Report Submitted!",
                      message: "View reports to check report statuses",
                      duration: Duration(seconds: 3),
                    )..show(context);
                  }),
            )
          ]),
        ));
  }

  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            CustomText(
              text: "Insert Image",
              size: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                  Navigator.pop(
                      context); //i added this myself to remove the bottom sheet after taking a photo
                },
                label: CustomText(text: "Camera", color: Colors.blueAccent),
              ),
              SizedBox(width: 15),
              TextButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  label: CustomText(text: "Gallery", color: Colors.blueAccent)),
            ])
          ],
        ));
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );

    setState(() {
      if (_imageFile != null) {
        _imageFile = File(pickedFile.path);
        print('image path is $_imageFile');
      }
      //dispose();
    });
  }

  Future uploadPic(BuildContext context) async {
    fileName = path.basename(_imageFile.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    // StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    url = dowurl.toString();
    print("uploadpic url is " + url);
    return url;
    // setState(() {
    //   print("Uploaded");
    //   //dispose();
    // });
  }
}
