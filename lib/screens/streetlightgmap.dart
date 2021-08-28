import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StreetlightGmapScreen extends StatefulWidget {
  // const StreetlightGmapScreen({ Key? key }) : super(key: key);

  @override
  _StreetlightGmapScreenState createState() => _StreetlightGmapScreenState();
}

class _StreetlightGmapScreenState extends State<StreetlightGmapScreen> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/circle.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(4.3243149, 101.1534569),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "1");
            },
            title: "Streetlight Number: #1",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('2'),
        position: LatLng(4.3243678, 101.1531159),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "2");
            },
            title: "Streetlight Number: #2",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('3'),
        position: LatLng(4.32442206, 101.1527803),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "3");
            },
            title: "Streetlight Number: #3",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('4'),
        position: LatLng(4.3244764, 101.1524434),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "4");
            },
            title: "Streetlight Number: #4",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('5'),
        position: LatLng(4.3245446, 101.1521161),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "5");
            },
            title: "Streetlight Number: #5",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('6'),
        position: LatLng(4.324585, 101.151788),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "6");
            },
            title: "Streetlight Number: #6",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('7'),
        position: LatLng(4.324626, 101.151437),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "7");
            },
            title: "Streetlight Number: #7",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('8'),
        position: LatLng(4.324700, 101.151113),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "8");
            },
            title: "Streetlight Number: #8",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('9'),
        position: LatLng(4.324640, 101.150893),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "9");
            },
            title: "Streetlight Number: #9",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('10'),
        position: LatLng(4.324753, 101.150598),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "10");
            },
            title: "Streetlight Number: #10",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('11'),
        position: LatLng(4.325004, 101.150904),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "11");
            },
            title: "Streetlight Number: #11",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('12'),
        position: LatLng(4.324820, 101.150148),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "12");
            },
            title: "Streetlight Number: #12",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('13'),
        position: LatLng(4.324871, 101.149799),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "13");
            },
            title: "Streetlight Number: #13",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('14'),
        position: LatLng(4.324920, 101.149362),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "14");
            },
            title: "Streetlight Number: #14",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('15'),
        position: LatLng(4.324978, 101.148978),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "15");
            },
            title: "Streetlight Number: #15",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('16'),
        position: LatLng(4.325243, 101.148765),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "16");
            },
            title: "Streetlight Number: #16",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('17'),
        position: LatLng(4.324998, 101.148766),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "17");
            },
            title: "Streetlight Number: #17",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('18'),
        position: LatLng(4.325051, 101.148475),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "18");
            },
            title: "Streetlight Number: #18",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('19'),
        position: LatLng(4.325291, 101.148465),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "19");
            },
            title: "Streetlight Number: #19",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('20'),
        position: LatLng(4.325333, 101.148210),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "20");
            },
            title: "Streetlight Number: #20",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('21'),
        position: LatLng(4.325109, 101.148152),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "21");
            },
            title: "Streetlight Number: #21",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('22'),
        position: LatLng(4.325335, 101.148209),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "22");
            },
            title: "Streetlight Number: #22",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('23'),
        position: LatLng(4.325375, 101.147953),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "23");
            },
            title: "Streetlight Number: #23",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('24'),
        position: LatLng(4.325160, 101.147886),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "24");
            },
            title: "Streetlight Number: #24",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('25'),
        position: LatLng(4.325412, 101.147695),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "25");
            },
            title: "Streetlight Number: #25",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('26'),
        position: LatLng(4.325261, 101.147366),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "26");
            },
            title: "Streetlight Number: #26",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('27'),
        position: LatLng(4.325284, 101.147134),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "27");
            },
            title: "Streetlight Number: #27",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('28'),
        position: LatLng(4.325673, 101.146259),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "28");
            },
            title: "Streetlight Number: #28",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('29'),
        position: LatLng(4.325645, 101.145965),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "29");
            },
            title: "Streetlight Number: #29",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('30'),
        position: LatLng(4.325711, 101.146044),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "30");
            },
            title: "Streetlight Number: #30",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('31'),
        position: LatLng(4.325522, 101.145791),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "31");
            },
            title: "Streetlight Number: #31",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('32'),
        position: LatLng(4.325649, 101.145079),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "32");
            },
            title: "Streetlight Number: #32",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('33'),
        position: LatLng(4.325727, 101.144607),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "33");
            },
            title: "Streetlight Number: #33",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('34'),
        position: LatLng(4.325763, 101.144226),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "34");
            },
            title: "Streetlight Number: #34",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('35'),
        position: LatLng(4.325841, 101.143806),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "35");
            },
            title: "Streetlight Number: #35",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('36'),
        position: LatLng(4.325941, 101.143100),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "36");
            },
            title: "Streetlight Number: #306",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('37'),
        position: LatLng(4.326251, 101.142868),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "37");
            },
            title: "Streetlight Number: #37",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('38'),
        position: LatLng(4.326201, 101.143092),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "38");
            },
            title: "Streetlight Number: #38",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('39'),
        position: LatLng(4.326177, 101.143274),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "39");
            },
            title: "Streetlight Number: #39",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('40'),
        position: LatLng(4.326102, 101.143593),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "40");
            },
            title: "Streetlight Number: #40",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('41'),
        position: LatLng(4.326044, 101.143986),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "41");
            },
            title: "Streetlight Number: #41",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('42'),
        position: LatLng(4.326011, 101.144223),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "42");
            },
            title: "Streetlight Number: #42",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('43'),
        position: LatLng(4.325957, 101.144544),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "43");
            },
            title: "Streetlight Number: #43",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('44'),
        position: LatLng(4.325874, 101.144866),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "44");
            },
            title: "Streetlight Number: #44",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('45'),
        position: LatLng(4.325855, 101.145196),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "45");
            },
            title: "Streetlight Number: #45",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('46'),
        position: LatLng(4.325731, 101.145833),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "46");
            },
            title: "Streetlight Number: #46",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('47'),
        position: LatLng(4.325946, 101.146113),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "47");
            },
            title: "Streetlight Number: #47",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('48'),
        position: LatLng(4.326237, 101.146165),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "48");
            },
            title: "Streetlight Number: #48",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('49'),
        position: LatLng(4.326327, 101.146397),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "49");
            },
            title: "Streetlight Number: #49",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('50'),
        position: LatLng(4.326494, 101.146185),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "50");
            },
            title: "Streetlight Number: #50",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('51'),
        position: LatLng(4.326907, 101.146256),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "51");
            },
            title: "Streetlight Number: #51",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('52'),
        position: LatLng(4.326888, 101.146250),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "52");
            },
            title: "Streetlight Number: #52",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('53'),
        position: LatLng(4.327114, 101.146216),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "53");
            },
            title: "Streetlight Number: #53",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('54'),
        position: LatLng(4.327219, 101.145625),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "54");
            },
            title: "Streetlight Number: #54",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('55'),
        position: LatLng(4.327001, 101.145120),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "55");
            },
            title: "Streetlight Number: #55",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('56'),
        position: LatLng(4.327192, 101.144919),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "56");
            },
            title: "Streetlight Number: #56",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('57'),
        position: LatLng(4.327553, 101.144814),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "57");
            },
            title: "Streetlight Number: #57",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('58'),
        position: LatLng(4.327815, 101.144912),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "58");
            },
            title: "Streetlight Number: #58",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('59'),
        position: LatLng(4.328702, 101.145034),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "59");
            },
            title: "Streetlight Number: #59",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('60'),
        position: LatLng(4.329000, 101.145090),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "60");
            },
            title: "Streetlight Number: #60",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('61'),
        position: LatLng(4.329178, 101.145116),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "61");
            },
            title: "Streetlight Number: #61",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('62'),
        position: LatLng(4.329482, 101.145167),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "62");
            },
            title: "Streetlight Number: #62",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('63'),
        position: LatLng(4.329607, 101.145478),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "63");
            },
            title: "Streetlight Number: #63",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('64'),
        position: LatLng(4.329600, 101.145751),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "64");
            },
            title: "Streetlight Number: #64",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('65'),
        position: LatLng(4.329609, 101.146264),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "65");
            },
            title: "Streetlight Number: #65",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('66'),
        position: LatLng(4.329414, 101.146251),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "66");
            },
            title: "Streetlight Number: #66",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('67'),
        position: LatLng(4.328919, 101.146255),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "67");
            },
            title: "Streetlight Number: #67",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('68'),
        position: LatLng(4.328661, 101.146270),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "68");
            },
            title: "Streetlight Number: #68",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('69'),
        position: LatLng(4.328414, 101.146270),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "69");
            },
            title: "Streetlight Number: #69",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('70'),
        position: LatLng(4.328077, 101.146259),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "70");
            },
            title: "Streetlight Number: #70",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('71'),
        position: LatLng(4.327865, 101.146272),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "71");
            },
            title: "Streetlight Number: #71",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('72'),
        position: LatLng(4.327643, 101.146261),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "72");
            },
            title: "Streetlight Number: #72",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('73'),
        position: LatLng(4.326583, 101.142926),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "73");
            },
            title: "Streetlight Number: #73",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('74'),
        position: LatLng(4.326959, 101.142977),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "74");
            },
            title: "Streetlight Number: #74",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('75'),
        position: LatLng(4.327372, 101.143079),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "75");
            },
            title: "Streetlight Number: #75",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('76'),
        position: LatLng(4.327642, 101.143107),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "76");
            },
            title: "Streetlight Number: #76",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('77'),
        position: LatLng(4.327926, 101.143148),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "77");
            },
            title: "Streetlight Number: #77",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('78'),
        position: LatLng(4.328074, 101.143392),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "78");
            },
            title: "Streetlight Number: #78",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('79'),
        position: LatLng(4.328033, 101.143641),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "79");
            },
            title: "Streetlight Number: #79",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('80'),
        position: LatLng(4.327977, 101.143973),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "80");
            },
            title: "Streetlight Number: #80",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('81'),
        position: LatLng(4.327930, 101.144250),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "81");
            },
            title: "Streetlight Number: #81",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('82'),
        position: LatLng(4.328301, 101.143230),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "82");
            },
            title: "Streetlight Number: #82",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('83'),
        position: LatLng(4.328689, 101.143311),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "83");
            },
            title: "Streetlight Number: #83",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('84'),
        position: LatLng(4.329142, 101.143355),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "84");
            },
            title: "Streetlight Number: #84",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('85'),
        position: LatLng(4.329257, 101.143378),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "85");
            },
            title: "Streetlight Number: #85",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('86'),
        position: LatLng(4.329372, 101.143652),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "86");
            },
            title: "Streetlight Number: #86",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('87'),
        position: LatLng(4.329283, 101.144195),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "87");
            },
            title: "Streetlight Number: #87",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('88'),
        position: LatLng(4.329167, 101.144798),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "88");
            },
            title: "Streetlight Number: #88",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('89'),
        position: LatLng(4.329147, 101.144967),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "89");
            },
            title: "Streetlight Number: #89",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('90'),
        position: LatLng(4.329536, 101.143423),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "90");
            },
            title: "Streetlight Number: #90",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('91'),
        position: LatLng(4.329810, 101.143424),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "91");
            },
            title: "Streetlight Number: #91",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('92'),
        position: LatLng(4.330125, 101.143450),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "92");
            },
            title: "Streetlight Number: #92",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('93'),
        position: LatLng(4.330364, 101.143473),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "93");
            },
            title: "Streetlight Number: #93",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('94'),
        position: LatLng(4.330490, 101.143803),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "94");
            },
            title: "Streetlight Number: #94",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('95'),
        position: LatLng(4.330492, 101.144068),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "95");
            },
            title: "Streetlight Number: #95",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('96'),
        position: LatLng(4.330484, 101.144327),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "96");
            },
            title: "Streetlight Number: #96",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('97'),
        position: LatLng(4.330482, 101.144772),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "97");
            },
            title: "Streetlight Number: #97",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('98'),
        position: LatLng(4.330479, 101.145117),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "98");
            },
            title: "Streetlight Number: #98",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('99'),
        position: LatLng(4.330474, 101.145463),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "99");
            },
            title: "Streetlight Number: #99",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('100'),
        position: LatLng(4.330471, 101.145813),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "100");
            },
            title: "Streetlight Number: #100",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('101'),
        position: LatLng(4.330471, 101.146114),
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.pop(context, "101");
            },
            title: "Streetlight Number: #101",
            snippet: "Tap to Select this Streetlight"),
        icon: mapMarker,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Streetlight List"),
        ),
        body: GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(4.325175, 101.148659),
            zoom: 15,
          ),
        ));
  }
}

class Utils {
  static String mapStyle = '''
    [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]
  ''';
}
