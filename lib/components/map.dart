import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:w27/api.dart';

class CoronaMap extends StatefulWidget {
  @override
  _CoronaMapState createState() => _CoronaMapState();
}

class _CoronaMapState extends State<CoronaMap> {

  Completer<GoogleMapController> _controller = Completer();
  Location location = new Location();
  CameraPosition currentLocation = CameraPosition(target: LatLng(0,0));

  @override
  void initState() {
    super.initState();
    _updateLocation();
  }

  Future _updateLocation() async {
    try {
      LocationData locationData = await location.getLocation();
      setState(() {
        currentLocation = CameraPosition(
          target: LatLng(locationData.latitude, locationData.longitude),
          zoom: 15
        );

        API.getMetaData('ChIJN1t_tDeuEmsRUsoyG83frY4').then((data) {
          print(data);
        });

        _controller.future.then((controller) {
          controller.animateCamera(CameraUpdate.newCameraPosition(currentLocation));
        });
      });
    } on Exception {
      print('error fetching location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: currentLocation,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      }
    );
  }
}
