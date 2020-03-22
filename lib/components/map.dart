import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:w27/components/place/place_card.dart';
import 'package:w27/helper/popups.dart';

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
          zoom: 17
        );

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
      },
      onTap: (LatLng position) {
        Popups.generic(
          context: context,
          height: 400,
          content: PlaceCard(
            lat: position.latitude,
            lng: position.longitude
          )
        );
      },
    );
  }
}
