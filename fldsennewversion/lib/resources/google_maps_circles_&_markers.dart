// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//creates circles on the google maps map/view/widget
Set<Circle> circles = {
  Circle(
    circleId: const CircleId('GardenCityBlue'),
    center: const LatLng(15.590425134106294, 32.57178206127711),
    radius: 400,
    fillColor: Colors.blue.shade100.withOpacity(0.5),
    strokeColor: Colors.lightBlueAccent.shade100.withOpacity(0.5),
  ),

  Circle(
    circleId: const CircleId('MuseumBlue'),
    center: const LatLng(15.615276421652565, 32.51010017952815),
    radius: 400,
    fillColor: Colors.blue.shade100.withOpacity(0.5),
    strokeColor: Colors.lightBlue.shade100.withOpacity(0.2),
  ),

  // Circle(
  //   circleId: const CircleId('GardenCityRed'),
  //   center: const LatLng(15.590425134106294, 32.57178206127711),
  //   radius: 400,
  //   fillColor: Colors.red.shade100.withOpacity(0.5),
  //   strokeColor: Colors.redAccent.shade100.withOpacity(0.5),
  // ),

  // Circle(
  //   circleId: const CircleId('MuseumRed'),
  //   center: const LatLng(15.615276421652565, 32.51010017952815),
  //   radius: 400,
  //   fillColor: Colors.red.shade100.withOpacity(0.5),
  //   strokeColor: Colors.redAccent.shade100.withOpacity(0.2),
  // ),

  // Circle(
  //   circleId: const CircleId('DefaultLocationBlue'),
  //   center: const LatLng(0, 0),
  //   radius: 400,
  //   fillColor: Colors.lightBlueAccent.shade100.withOpacity(0.5),
  //   strokeColor: Colors.lightBlue.shade100.withOpacity(0.2),
  // ),
  // Circle(
  //   circleId: const CircleId('DefaultLocationRed'),
  //   center: const LatLng(0, 0),
  //   radius: 400,
  //   fillColor: Colors.red.shade100.withOpacity(0.5),
  //   strokeColor: Colors.lightBlue.shade100.withOpacity(0.2),
  // )
};

Set<Marker> markers = {
  const Marker(
      markerId: MarkerId('GardenCity'),
      position: LatLng(15.590425134106294, 32.57178206127711),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Garden City',
      )),
  const Marker(
      markerId: MarkerId('Museum'),
      position: LatLng(15.615276421652565, 32.51010017952815),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: "Sudan's National Museum",
      )),
  const Marker(
      markerId: MarkerId('LosAngeles'),
      position: LatLng(34.052235, -118.243683),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: "Los Angeles, California",
      ))
};
