import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<void> getGeoLocationPosition(BuildContext context, Function(Position) onPositionReceived) async {
  // ignore: deprecated_member_use
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);//geolocator      
  onPositionReceived(position);   
}

Future<void> getAddressFromLongLat(Position position, Function(String) onAddressReceived)async {
  //lat= vertical, long = horizontal
  List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude); 
  Placemark place = placemark[0];
  String address = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
  onAddressReceived(address);
  // onAddressReceived(address);
}

Future<bool> handleLocationPermission(BuildContext context) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.location_off,
            color: Colors.white,
            ),
            SizedBox(width: 10,),
            Text(
              'Location services are disabled. Please enable the service',
              style: TextStyle(color: Colors.white),
            )
        ],
      ),
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    )); 
  return false; //karena dia negative jadi false
   }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.location_off,
                color: Colors.white,
              ),
            SizedBox(width: 10),
            Text(
              "Location Permission Denied.",
              style: TextStyle(
                color: Colors.white
              ),
            )
            ],
          ),
          backgroundColor: Colors.blueGrey,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,  
        ));
        return false; //untuk memblokir user
    }
}

if (permission == LocationPermission.deniedForever) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.location_off,
          color: Colors.white,
        ),
        SizedBox(width: 10,),
        Text(
          "Location permission is permanently denied, we cannot request it at runtime, enable it manually.",
          style: TextStyle(color: Colors.white),
        )
      ]
    ),
    backgroundColor: Colors.blueGrey,
    shape: StadiumBorder(),
    behavior: SnackBarBehavior.floating,
  ));
  return false;
}
return true;
}