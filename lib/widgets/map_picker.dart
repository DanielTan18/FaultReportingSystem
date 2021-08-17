import 'dart:async';

import 'package:flutter/material.dart';
import '../providers/location.dart';
import '../controller/picker_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPicker extends StatefulWidget {
  final PickerBloc bloc;
  MapPicker(this.bloc);

  @override
  State<MapPicker> createState() => MapPickerState();
}

class MapPickerState extends State<MapPicker> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _target = LatLng(4.2105, 101.9758);

  @override
  void initState() {
    super.initState();
    widget.bloc.locationController.stream.listen(
      (location) async {
        GoogleMapController mapController = await _controller.future;
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                location.lat,
                location.lng,
              ),
              zoom: 15.0,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
              target: _target,
              zoom: 7,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onCameraMove: (CameraPosition newPosition) async {
              widget.bloc.setLocationByMovingMap(Location(
                lat: newPosition.target.latitude,
                lng: newPosition.target.longitude,
              ));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Center(
              child: Icon(
                Icons.location_on,
                color: Colors.red,
                size: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
