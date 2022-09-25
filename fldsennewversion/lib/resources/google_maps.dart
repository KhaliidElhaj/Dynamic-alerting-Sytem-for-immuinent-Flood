import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'google_maps_circles_&_markers.dart';

dynamic lat = 0.0;
dynamic long = 0.0;

final Completer<GoogleMapController> _controller =
    Completer(); //a default camera position
CameraPosition campos = CameraPosition(
  target: LatLng(lat, long),
  zoom: 14.4746,
);

CameraPosition campos2 = const CameraPosition(
  target: LatLng(15.590425134106294, 32.57178206127711),
  zoom: 14.4746,
);

GoogleMap buildGoogleMap() {
  return GoogleMap(
    myLocationButtonEnabled: false,
    myLocationEnabled: false,
    mapType: MapType.normal,
    initialCameraPosition: campos,
    onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    },

    zoomControlsEnabled: false,
    minMaxZoomPreference: const MinMaxZoomPreference(15, 15),
    onCameraMove: null,
    circles:
        circles,
    markers: markers,//draws circles on certain coords, located in google_maps_circles_&_markers.dart
  );
}

//updates the camera pos when the function is called
Future<void> moveCamera() async {
  final GoogleMapController controller = await _controller.future;
  controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
    target: LatLng(lat, long),
    zoom: 14.4746,
  )));
  debugPrint('Camera Moved');
}

//calls the move camera function but delays it so the data it uses is synced up
moveCameraWithDelay() {
  Future.delayed(const Duration(milliseconds: 500), () {
    moveCamera();
  });
}
