import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  String a = '0';
  String b = '0';

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
//vị trí mặc định
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;
  }

  @override
  Widget build(BuildContext context) {
    Future<Position> position =
        Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          _getLocation().then((value) {
            a = '${value.latitude}';
            b = '${value.longitude}';
          });
          double lat = double.parse(a);
          double long = double.parse(b);

          _goToTheLake(lat, long);
        },
        child: Text('Đến vị trí'),
      ),
    );
  }

  // Future<Position> _goToLoCation() async {
  //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if(!serviceEnabled){
  //     return Future.error('Không thể định vị')
  //   }
  // }

  Future<void> _goToTheLake(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lat, long),

        // tilt: 59.440717697143555,
        zoom: 17.151926040649414)));
  }

  Future<Position> _getLocation() async {
    bool seviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!seviceEnabled) {
      return Future.error('Không lấy được vị trí');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Không lấy được vị trí.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Loi');
    }
    return await Geolocator.getCurrentPosition();
  }
}
