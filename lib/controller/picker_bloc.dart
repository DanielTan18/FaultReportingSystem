import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import '../providers/location.dart';

class PickerBloc with ChangeNotifier {
  StreamController<Location> locationController =
      StreamController<Location>.broadcast();
  Location currentLocation;
  static const mapKey = 'AIzaSyB-Zw1cjaBj1-D381tXQDc-Ch7H5WC12mU';

  static PickerBloc _instance;
  static PickerBloc getInstance() {
    if (_instance == null) {
      _instance = PickerBloc._internal();
    }
    return _instance;
  }

  PickerBloc._internal();

  Future<List<Location>> search(String query) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$mapKey";
    Response response = await Dio().get(url);
    return Location.parseLocationList(response.data);
  }

  void locationSelected(Location location) {
    locationController.sink.add(location);
  }

  void setLocationByMovingMap(Location location) {
    currentLocation = location;
  }

  // ignore: must_call_super
  void dispose() {
    print('close');
    _instance = null;
    locationController.close();
  }
}
