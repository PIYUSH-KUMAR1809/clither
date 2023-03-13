import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    try{
      // ignore: unused_local_variable
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      longitude = position.longitude;
      latitude = position.latitude;
    }
    catch(e){
      if (kDebugMode) {
        if (kDebugMode) {
          if (kDebugMode) {
            print(e);
          }
        }
      }
    }
  }
}