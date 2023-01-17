// ignore: unused_import
import 'dart:collection';
import '/Model/trip_list.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: unused_import
import '/Model/trip.dart';
// ignore: unused_import

// ignore: camel_case_types, use_key_in_widget_constructors
class tripMap extends StatefulWidget {
  static const screenroute = 'tripMap';
  // const tripMap({Key? key}) : super(key: key);

  @override
  State<tripMap> createState() => _tripMapState();
}

// ignore: camel_case_types
class _tripMapState extends State<tripMap> {
  var mymareks = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final tripid = ModalRoute.of(context)!.settings.arguments as String;
    // // ignore: avoid_types_as_parameter_names
    // print(tripid);
    // ignore: avoid_types_as_parameter_names
    final selectItem = GetData.items.firstWhere((trip) => trip.id == tripid);
    // ignore: prefer_const_constructors

    // var selectLatLng2 = selectLatLng;
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          selectItem.title.toString(),
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition:
            // ignore: prefer_const_constructors
            CameraPosition(
                target: LatLng(
                    selectItem.Lat!.toDouble(), selectItem.Lng!.toDouble()),
                zoom: 19),
        onMapCreated: (GoogleMapController googleMapController) => setState(
          () {
            // ignore: prefer_const_constructors
            mymareks.add(
              Marker(
                // ignore: prefer_const_constructors
                markerId: MarkerId(selectItem.id.toString()),

                // ignore: prefer_const_constructors
                infoWindow: InfoWindow(title: selectItem.title),
                // ignore: prefer_const_constructors
                position: LatLng(
                    selectItem.Lat!.toDouble(), selectItem.Lng!.toDouble()),
              ),
            );
          },
        ),
        markers: mymareks,
      ),
    );
  }
}
